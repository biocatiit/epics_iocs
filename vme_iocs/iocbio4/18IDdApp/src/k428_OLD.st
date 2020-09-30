program k428 ("name=k428, P=prefix:, G=gpib, A=22")

option +r;
option +d;
%% #include <string.h>
%% #include <math.h>
/*%% #include <stdioLib.h>*/
%% #include <epicsStdio.h>
/*%% #include <taskLib.h>*/
%% #include <epicsThread.h>
#include "seqPVmacros.h"

/*
 * Interacts with a Keithley 428 current amplifier
 * using the generic GPIB record.
 *
 * usage:
 ld < uniApp/src/O.mv162/k428.o
 seq &k428, "name=D2, P=iad:D2:, G=iad:gpib:l13:a22, A=22"
 seq &k428, "name=D3, P=iad:D3:, G=iad:gpib:l13:a25, A=25"
 
 * to kill the running sequence program, choose one like this:
 td "k428"
 td "D2"
 td "D3"
 *
 */ 

/*
  Change log:
     2.4:  2002-10-29 PRJ  use macros from seqPVmacros.h to connect PVs
			   set EPICS readback values from EEPROM values
			     U  -> suppression
			     U2 -> biasRdbk
			     U2 -> biasRdbk
			     U3 -> totalgain
			     R  -> totalgain
			   added debugging to SEND, RECEIVE, and SEND_RECEIVE
			   added epicsThreadSleep at end of SEND
			   print compile date during init state
			   removed unconditional jump states error->disable
     2.3:  2002-04-05 PRJ  save any changes to K428 EEPROM
                           recover all parameters from EEPROM at boot
                           scroll display text
     2.2:  1998-09-23 PRJ  when disable->enable, go to state EPICStoKeithley
     			   check error status more often
     2.1:  1997-09-30 PRJ  added "enable/disable" bit
     			   added KeithleytoEPICS and EPICStoKeithley
 */

/*
   Description of program macros:
     P: prefix for PVs needed by this program
     G: PV name of generic GPIB record
     A: GPIB address
     L: EPICS interface GPIB link number
 */

/*
  To be done:
     add a flag to ignore severity
     set error code

   reference manual:
   http://lansce.lanl.gov/lansce8/Epics/sequencer/snl_1.9_man.html


 */

/********************************************************** 
 ***   variable assignments and process variable links  ***
 **********************************************************/

/*--------------------
  --------------------      GPIB record variables
  -------------------- */
PV(long,   gpib_address,    "{G}.ADDR",   NoMon);
PV(short,  write_read_mode, "{G}.TMOD",   NoMon);
PV(short,  input_format,    "{G}.IFMT",   NoMon);
PV(short,  output_format,   "{G}.OFMT",   NoMon);
PV(string, end_of_string,   "{G}.IEOS",   NoMon);
PV(long,   num_bytes_req,   "{G}.NRRD",   NoMon);
PV(string, gpib_command,    "{G}.AOUT",   NoMon);
/* PV(short,  serial_poll_req, "{G}.SPR",   NoMon); */

PV(long,   num_bytes_read,  "{G}.NORD", Monitor);
PV(string, gpib_response,   "{G}.AINP", Monitor);
PV(short,  severity,        "{G}.SEVR", Monitor);
PV(long,   timeout,         "{G}.TMOT", Monitor);

/*--------------------
  --------------------      program variables
  -------------------- */
string command;
string response;
evflag error_flag;
short  address;

evflag  cmd_U;	   evflag  cmd_U2;
evflag  cmd_U0;    evflag  cmd_U3;
evflag  cmd_U1;    evflag  cmd_U4;

PV(short,  user,             "{P}user",        EvFlag);
PV(string, display,	     "{P}display",     EvFlag);
PV(float,  suppression,      "{P}suppression", NoMon);
PV(float,  totalgain,	     "{P}totalgain",   NoMon);
PV(short,  overload,	     "{P}overload",    NoMon);
PV(short,  self_test_result, "{P}selftest",    NoMon);
PV(short,  EOI, 	     "{P}EOI",         NoMon);
PV(short,  holdoff,	     "{P}holdoff",     NoMon);
/* PV(short, SRQ_mask,         "{P}SRQmask",     NoMon); */
/* PV(short, last_pressed,     "{P}lastkey",     NoMon); */

PV(float,  biasRdbk,	     "{P}biasRdbk",    NoMon);
PV(float,  bias,	     "{P}bias",        EvFlag);
PV(short,  x10, 	     "{P}x10",	       EvFlag);
PV(short,  brightness,	     "{P}brightness",  EvFlag);
PV(short,  use_bias,	     "{P}use_bias",    EvFlag);
PV(short,  zero_check,	     "{P}zero_check",  EvFlag);
PV(short,  filter,	     "{P}filter",      EvFlag);
PV(short,  gain,	     "{P}gain",        EvFlag);
PV(short,  autoSupp,	     "{P}autoSupp",    EvFlag);
PV(short,  supprD,	     "{P}supprD",      EvFlag);
PV(float,  supprM,	     "{P}supprM",      EvFlag);
PV(short,  risetime,	     "{P}risetime",    EvFlag);
PV(short,  autofilter,	     "{P}autofilter",  EvFlag);
PV(short,  enable,	     "{P}enable",      Monitor);

PV(short,  err_IDDC,		 "{P}err:IDDC",      NoMon);
PV(short,  err_IDDCO,		 "{P}err:IDDCO",     NoMon);
PV(short,  err_not_in_remote,	 "{P}err:noRem",     NoMon);
PV(short,  err_self_test_failed, "{P}err:selftest",  NoMon);
PV(short,  err_supp_range_val,   "{P}err:suppRange", NoMon);
PV(short,  err_input_current,	 "{P}err:inCurr",    NoMon);
PV(short,  err_autosuppression,  "{P}err:autoSupp",  NoMon);
PV(short,  err_zero_correction,  "{P}err:zeroCorr",  NoMon);
PV(short,  err_EEPROM,  	 "{P}err:EEPROM",    NoMon);
PV(short,  err_overload,	 "{P}err:overload",  NoMon);
PV(short,  err_gain_risetime,	 "{P}err:gainRise",  NoMon);

#define DISPLAY_UPDATE_PERIOD_S		(0.25)
#define DISPLAY_BUFFER_SIZE		1024
#define K428_DISPLAY_SIZE		10
int     displayBufferIndex;
int	displayBufferLength;
char    displayBuffer[DISPLAY_BUFFER_SIZE];
assign  displayBuffer to "{P}dispBuff";
/*
  displayBuffer points to {P}dispBuff which is defined:
       grecord(waveform, "$(P)dispBuff")
       {
               field(DESC, "display buffer")
               field(NELM, "1024")
               field(FTVL, "UCHAR")
       }
*/

/*--------------------
  --------------------      diagnostics
  -------------------- */
PV(short,  debug_level, "{P}debug",   Monitor);	/* bo */
#define debug_flag ( debug_level )
PV(long,   error,	"{P}error",   NoMon);	/* longout */
PV(string, msg1,	"{P}msg1",    NoMon);	/* stringout */
PV(string, msg2,	"{P}msg2",    NoMon);	/* stringout */
PV(string, msg3,	"{P}msg3",    NoMon);	/* stringout */

string  msg;
char    *taskName;
#define SNLtaskName taskName
char    *scratchStr;
short   proceed;
evflag  startupComplete;
string  aString;
char    aChar;
short   aShort;
float   aFloat;
short   next_display;
string  U_msg;
string  U0_msg;
string  U1_msg;
string  U2_msg;
string  U3_msg;
string  U4_msg;
string  buffer;

/*------------------------------------------------ 
  ------------------------------------------------   macros
  ------------------------------------------------ */

#define LUFT_PAUSE  epicsThreadSleep (0.0)

#define PVPUT(PV,VAL)  {PV = (VAL);  pvPut(PV);}

#define NEW_MSG(MSG) {\
	  strcpy(msg3, msg2); \
	  strcpy(msg2, msg1); \
	  strcpy(msg1, MSG); \
	  pvPut(msg1); \
	  pvPut(msg2); \
	  pvPut(msg3); \
	  if (debug_level) epicsThreadSleep(1.0); \
	}

#define COUNTDOWN 	\
	if (debug_level) { \
	  printf("    countdown:");  epicsThreadSleep(0.0); \
	  printf(" 5 ...");  epicsThreadSleep(1.0); \
	  printf(" 4 ...");  epicsThreadSleep(1.0); \
	  printf(" 3 ...");  epicsThreadSleep(1.0); \
	  printf(" 2 ...");  epicsThreadSleep(1.0); \
	  printf(" 1 ...");  epicsThreadSleep(1.0); \
	  printf(" now\n");  epicsThreadSleep(0.015); \
	}


#define SEND(COMMAND)				\
      if (!efTest (error_flag)) {		\
        DEBUG_PRINT (10, "SEND");		\
        PVPUT (gpib_address, address);		\
        PVPUT (write_read_mode, 1);		\
        PVPUT (input_format,    0);		\
        PVPUTSTR (end_of_string,   "\r");		\
        PVPUT (num_bytes_req,   -1);		\
        sprintf (gpib_command, "%sX", COMMAND); \
        DEBUG_PRINT (10, gpib_command);		\
        pvPut (gpib_command);			\
	epicsThreadSleep (0.03);				\
      }

#define RECEIVE(RESPONSE)			\
      if (!efTest (error_flag)) {		\
        DEBUG_PRINT (10, "RECEIVE");		\
        PVPUT (gpib_address, address);		\
        PVPUT (write_read_mode, 2);		\
        PVPUT (input_format,    0);		\
        PVPUTSTR (end_of_string,   "\r");		\
        PVPUT (num_bytes_req,   -1);		\
        epicsThreadSleep(0.167);				\
        if (!severity)				\
          strcpy (RESPONSE, gpib_response);	\
          DEBUG_PRINT (10, gpib_response);	\
      }

#define SEND_RECEIVE(COMMAND,RESPONSE)		\
      if (!efTest (error_flag)) {		\
        DEBUG_PRINT (10, "SEND_RECEIVE");	\
        PVPUT (gpib_address, address);		\
        PVPUT (write_read_mode, 0);		\
        PVPUT (input_format,    0);		\
        PVPUT (output_format,   0);		\
        PVPUTSTR (end_of_string,   "\r");		\
        PVPUT (num_bytes_req,   -1);		\
        sprintf (gpib_command, "%sX", COMMAND); \
        DEBUG_PRINT (10, gpib_command);		\
        pvPut (gpib_command);			\
        epicsThreadSleep (0.25);				\
        if (!severity)				\
          strcpy (RESPONSE, gpib_response); 	\
          DEBUG_PRINT (10, gpib_response);	\
        }

#define BUILD_DISPLAY_BUFFER			\
  strcpy(pVar->displayBuffer, "EPICS ON,  ");		\
  sprintf (pVar->msg, "%s,  ", pVar->display);					strcat(pVar->displayBuffer, pVar->msg);	\
  sprintf (pVar->msg, "1.0E%d V/A GAIN,  ", 3 + pVar->gain + pVar->x10);	strcat(pVar->displayBuffer, pVar->msg);	\
  if (pVar->filter) {\
    sprintf (pVar->msg, "%s RISETIME,  ", timeStr[pVar->risetime]);		strcat(pVar->displayBuffer, pVar->msg);	\
  } \
  if (pVar->autoSupp) {\
    sprintf (pVar->msg, "%.3fE%d A OFFSET,  ", pVar->supprM, pVar->supprD-9);	strcat(pVar->displayBuffer, pVar->msg);	\
  } \
  if (pVar->use_bias) {\
    sprintf (pVar->msg, "%.4f V BIAS,  ", pVar->bias);				strcat(pVar->displayBuffer, pVar->msg);	\
  } \
  sprintf (pVar->msg, "TASKNAME=%s,  ", pVar->taskName);			strcat(pVar->displayBuffer, pVar->msg);	\
  pVar->displayBufferLength = strlen(pVar->displayBuffer);


%% static int extract_int (char *, int, int);
%% static char timeStr[10][20];
%% static int getNextK428Display (char *, int, int, char *);


#define  K428_CMD_RESET_EEPROM_DEFAULTS	"L0"
#define  K428_CMD_SAVE_TO_EEPROM	"L1"
#define  K428_CMD_RESET_FROM_EEPROM	"L2"
#define  K428_CMD_SEND_SUPPRESS_VALUE	"U"
#define  K428_CMD_SEND_MACH_STATUS_WORD	"U0"
#define  K428_CMD_SEND_ERR_STATUS_WORD	"U1"
#define  K428_CMD_SEND_BIAS_VALUE	"U2"
#define  K428_CMD_SEND_TOTAL_GAIN	"U3"
#define  K428_CMD_SEND_MODEL_NUM_REV	"U4"


/*------------------------------------------------ 
  ------------------------------------------------   commands
  ------------------------------------------------
 */
ss commands {

  /********************************
   ********************************  init
   ********************************/
  state init {
    when () {
      efClear (startupComplete);
      PVPUT (debug_level, (debug_level % 11));
      printf ("\n\n");
      printf ("Keithley 428 Current Amplifier task starting up ...\n");
      printf ("filename: %s\n", __FILE__);
      printf ("compiled: %s, %s\n", __DATE__, __TIME__);
      /*
       * find the GPIB address and keep it for later
       */
      scratchStr = macValueGet ("A");
%%    pVar->address = extract_int (pVar->scratchStr, 0, 2);
      /*
       * find the task name and use it for debugging messages
       */
      taskName = macValueGet("name");
      printf ("task name: %s\n", taskName);
      /*
       * initialize some stuff
       */
      strcpy (msg1, ""); pvPut (msg1);
      strcpy (msg2, ""); pvPut (msg2);
      strcpy (msg3, ""); pvPut (msg3);
      strcpy (command, "");
      efClear (error_flag);

%{
      strcpy (timeStr[0], "10 uSEC");
      strcpy (timeStr[1], "30 uSEC");
      strcpy (timeStr[2], "100 uSEC");
      strcpy (timeStr[3], "300 uSEC");
      strcpy (timeStr[4], "1 mSEC");
      strcpy (timeStr[5], "3 mSEC");
      strcpy (timeStr[6], "10 mSEC");
      strcpy (timeStr[7], "30 mSEC");
      strcpy (timeStr[8], "100 mSEC");
      strcpy (timeStr[9], "300 mSEC");
}%

      /*
       * set the default display string to the prefix string 
       */
      scratchStr = macValueGet ("P");
      strcpy (display, scratchStr);  pvPut (display);
      /*
       * Send a command just to wake up the GPIB interface
       */
      SEND("DEPICS ON");
      efClear (cmd_U);
      efClear (cmd_U0);
      efClear (cmd_U1);
      efClear (cmd_U2);
      efClear (cmd_U3);
      efClear (cmd_U4);
      efClear (user_mon);
      efClear (brightness_mon);
      efClear (bias_mon);
      efClear (gain_mon);
      efClear (x10_mon);
      efClear (use_bias_mon);
      efClear (filter_mon);
      efClear (zero_check_mon);
      efClear (autoSupp_mon);
      efClear (risetime_mon);
      efClear (autofilter_mon);
      efClear (supprD_mon);
      efClear (supprM_mon);
      PVPUT (user, 1);
      displayBufferIndex = -1;
      NEW_MSG("Starting ...");
      efSet (startupComplete);
      /*
       * Now, use the values stored in the Keithley's EEPROM
       */
    } state KeithleyToEPICS
  }

  /******************************** 
   ********************************  error
   ********************************/
  state error {
    when (!efTest(error_flag)) {
        NEW_MSG( "Error cleared.  Restoring...")
        DEBUG_PRINT(1, msg1)
        PVPUT (user, 1);
    } state KeithleyToEPICS

    when (!severity) {
        NEW_MSG( "Severity == 0...")
        DEBUG_PRINT(1, msg1)
        efClear (error_flag);
        efSet (brightness_mon);
        efSet (bias_mon);
        efSet (gain_mon);
        efSet (x10_mon);
        efSet (use_bias_mon);
        efSet (filter_mon);
        efSet (zero_check_mon);
        efSet (autoSupp_mon);
        efSet (risetime_mon);
        efSet (autofilter_mon);
        efSet (supprD_mon);
        efSet (supprM_mon);
    } state idle

    /*
    when () {
      NEW_MSG("Support disabled");
      DEBUG_PRINT(3, msg1);
      SEND("DEPICS OFF");
    } state disable
    */

    when (delay(60)) {
        /* is device online?  update the display with info */
        NEW_MSG("idle for 60 sec");
        DEBUG_PRINT(3, msg1);
        next_display = next_display % 4; /* just in case it's uninitialized */
        if (next_display == 0) sprintf (aString, "D%s", display);
        if (next_display == 1) sprintf (aString, "DEPICS ON");
        if (next_display == 2) sprintf (aString, "D%s", taskName);
        if (next_display == 3) sprintf (aString, "DERROR");
        efClear (error_flag);
        SEND (aString);
        next_display = (next_display++) % 4;
    } state error
  } /* state error */

  /******************************** 
   ********************************  disable
   ********************************/
  state disable {
    when (enable) {
      NEW_MSG("Support enabled.  Restoring...");
      DEBUG_PRINT(3, msg1);
    } state EPICStoKeithley
  } /* state disable */

  /******************************** 
   ********************************  idle
   ********************************/
  state idle {
    when (efTest (error_flag)) {
        NEW_MSG("Error detected");
        DEBUG_PRINT(3, msg1);
    } state error

    when (!enable) {
      NEW_MSG("Support disabled");
      DEBUG_PRINT(3, msg1);
      SEND("DEPICS OFF");
    } state disable

    when (severity) {
        DEBUG_PRINT(3, "severity detected");
        efSet (error_flag);
        sprintf (msg, "severity = %d", severity);
        NEW_MSG(msg);
        DEBUG_PRINT(5, msg);
    } state idle

    when (efTest (user_mon) && (user == 3)) {
        if (user == 3) {
          NEW_MSG("Save values to K428 as power on");
          DEBUG_PRINT(3, msg1);
          SEND(K428_CMD_SAVE_TO_EEPROM);
        }
        PVPUT (user, 0);
        LUFT_PAUSE;
        efClear(user_mon);
    } state idle

    when (efTest (user_mon)) {
        if (user == 1) {
          NEW_MSG("K428 to EPICS");
          DEBUG_PRINT(3, msg1);
        }
        if (user == 2) {
          NEW_MSG("Reset K428 to factory defaults");
          DEBUG_PRINT(3, msg1);
          SEND(K428_CMD_RESET_EEPROM_DEFAULTS);
        }
        if (user == 4) {
          NEW_MSG("Reset K428 to power on values");
          DEBUG_PRINT(3, msg1);
          SEND(K428_CMD_RESET_FROM_EEPROM);
        }
        PVPUT (user, 0);
        LUFT_PAUSE;
        efClear(user_mon);
    } state KeithleyToEPICS

    when (efTest (cmd_U))  {
        DEBUG_PRINT(3, "command U");
        SEND_RECEIVE(K428_CMD_SEND_SUPPRESS_VALUE, U_msg);
        efClear (cmd_U);
        DEBUG_PRINT(3, U_msg);
	/*
	 set suppression to value returned by U_msg
	*/
	sscanf(U_msg, "NDCI%g", &suppression);
	pvPut(suppression);
	sprintf (aString, "suppression=%e", suppression);
        DEBUG_PRINT(8, aString);
    } state idle

    when (efTest (cmd_U0)) {
        DEBUG_PRINT(3, "command U0");
        SEND_RECEIVE(K428_CMD_SEND_MACH_STATUS_WORD, U0_msg);
        efClear (cmd_U0);
        DEBUG_PRINT(3, U0_msg);
/*        printf ("              %s <%s>\n", "U0", U0_msg);
        /* now what happens? */
    } state idle

    when (efTest (cmd_U1)) {
        /* error status word (14 bytes) */
        DEBUG_PRINT(3, "command U1");
        SEND_RECEIVE(K428_CMD_SEND_ERR_STATUS_WORD, U1_msg);
        efClear (cmd_U1);
        DEBUG_PRINT(3, U1_msg);
/*        printf ("              %s <%s>\n", "U1", U1_msg); /* */
%%      pVar->err_IDDC             = extract_int (pVar->U1_msg,  3, 1);
%%      pVar->err_IDDCO            = extract_int (pVar->U1_msg,  4, 1);
%%      pVar->err_not_in_remote    = extract_int (pVar->U1_msg,  5, 1);
%%      pVar->err_self_test_failed = extract_int (pVar->U1_msg,  6, 1);
%%      pVar->err_supp_range_val   = extract_int (pVar->U1_msg,  7, 1);
%%      pVar->err_input_current    = extract_int (pVar->U1_msg,  8, 1);
%%      pVar->err_autosuppression  = extract_int (pVar->U1_msg,  9, 1);
%%      pVar->err_zero_correction  = extract_int (pVar->U1_msg, 10, 1);
%%      pVar->err_EEPROM           = extract_int (pVar->U1_msg, 11, 1);
%%      pVar->err_overload         = extract_int (pVar->U1_msg, 12, 1);
%%      pVar->err_gain_risetime    = extract_int (pVar->U1_msg, 13, 1);
        pvPut (err_IDDC);
        pvPut (err_IDDCO);
        pvPut (err_not_in_remote);
        pvPut (err_self_test_failed);
        pvPut (err_supp_range_val);
        pvPut (err_input_current);
        pvPut (err_autosuppression);
        pvPut (err_zero_correction);
        pvPut (err_overload);
        pvPut (err_EEPROM);
        pvPut (err_gain_risetime);
    } state idle

    when (efTest (cmd_U2)) {
        DEBUG_PRINT(3, "command U2");
        SEND_RECEIVE(K428_CMD_SEND_BIAS_VALUE, U2_msg);
        efClear (cmd_U2);
        DEBUG_PRINT(3, U2_msg);
	/*
	 set biasRdbk to value returned by U2_msg
	*/
	sscanf(U_msg, "V%g", &biasRdbk);
	pvPut(biasRdbk);
	sprintf (aString, "biasRdbk=%g", biasRdbk);
        DEBUG_PRINT(8, aString);
    } state idle

    when (efTest (cmd_U3)) {
        DEBUG_PRINT(3, "command U3");
        SEND_RECEIVE(K428_CMD_SEND_TOTAL_GAIN, U3_msg);
        efClear (cmd_U3);
        DEBUG_PRINT(3, U3_msg);
	/*
	 set totalgain to value returned by U3_msg
	*/
	sscanf(U_msg, "%g", &totalgain);
	pvPut(totalgain);
	sprintf (aString, "totalgain=%e", totalgain);
        DEBUG_PRINT(8, aString);
    } state idle

    when (efTest (cmd_U4)) {
        DEBUG_PRINT(3, "command U4");
        SEND_RECEIVE(K428_CMD_SEND_MODEL_NUM_REV, U4_msg);
        efClear (cmd_U4);
        DEBUG_PRINT(3, U4_msg);
/*        printf ("              %s <%s>\n", "U4", U4_msg);
        /* now what happens? */
    } state idle

    when (efTest (brightness_mon)) {
        NEW_MSG("changed brightness");
        DEBUG_PRINT(3, msg1);
        sprintf (aString, "A%1d", brightness);
        SEND(aString);
        SEND(K428_CMD_SAVE_TO_EEPROM);
        LUFT_PAUSE;
        efClear (brightness_mon);
    } state idle

    when (efTest (use_bias_mon)) {
        NEW_MSG("changed bias mode");
        DEBUG_PRINT(3, "command B");
        sprintf (aString, "B%1d", use_bias);
        sprintf (msg, "V bias enable command: <%s>", aString);
        DEBUG_PRINT(5, msg);
        SEND (aString);
        SEND(K428_CMD_SAVE_TO_EEPROM);
%%	BUILD_DISPLAY_BUFFER;
        pvPut (displayBuffer);
	LUFT_PAUSE;
        efClear (use_bias_mon);
    } state idle

    when (efTest (zero_check_mon)) {
        NEW_MSG("changed zero check mode");
        DEBUG_PRINT(3, msg1);
        if (zero_check) {  /* turn off the auto suppression first! */
          SEND ("N0");
          PVPUT (autoSupp, 0);
          efClear (autoSupp_mon);
        }
        sprintf (aString, "C%1d", zero_check);
        sprintf (msg, "zero check enable command: <%s>", aString);
        DEBUG_PRINT(5, msg);
        SEND (aString);
        LUFT_PAUSE;
        SEND(K428_CMD_SAVE_TO_EEPROM);
        efClear (zero_check_mon);
    } state idle

    when (efTest (autoSupp_mon) && (autoSupp == 2)) {
        NEW_MSG("not available now");
#ifdef NOT_NOW
        DEBUG_PRINT(3, msg1);
        SEND ("C0");     /* turn off the zero_check first! */
        PVPUT (zero_check, 0);
        efClear (zero_check_mon);
        SEND ("N2");
        SEND(K428_CMD_SAVE_TO_EEPROM);
        LUFT_PAUSE;
#endif
        PVPUT (autoSupp, 0);  /* revert it to enable mode */
%%	BUILD_DISPLAY_BUFFER;
        pvPut (displayBuffer);
        efClear (autoSupp_mon);
    } state idle /* usually would got to KeithleyToEPICS */

    when (efTest (autoSupp_mon)) {
        NEW_MSG("changed suppr. mode");
        DEBUG_PRINT(3, msg1);
        if (autoSupp) {  /* turn off the zero_check first! */
          SEND ("C0");
          PVPUT (zero_check, 0);
          efClear (zero_check_mon);
        }
        sprintf (aString, "N%1d", autoSupp);
        sprintf (msg, "suppression enable: <%s>", aString);
        DEBUG_PRINT(5, msg);
        SEND (aString);
        SEND(K428_CMD_SAVE_TO_EEPROM);
%%	BUILD_DISPLAY_BUFFER;
        pvPut (displayBuffer);
        LUFT_PAUSE;
        efClear (autoSupp_mon);
    } state idle

    when (efTest (filter_mon)) {
        NEW_MSG("changed filter mode");
        DEBUG_PRINT (3, "filter changed");
        sprintf (aString, "P%1d", filter);
        sprintf (msg, "filter command: <%s>", aString);
        DEBUG_PRINT(5, msg);
        SEND (aString);
        SEND(K428_CMD_SAVE_TO_EEPROM);
%%	BUILD_DISPLAY_BUFFER;
        pvPut (displayBuffer);
        LUFT_PAUSE;
        efClear (filter_mon);
    } state idle

    when (efTest (gain_mon)) {
        NEW_MSG("changed gain");
        DEBUG_PRINT (3, "gain changed");
        sprintf (aString, "R%d", gain+3);
        /* sprintf (aString, "R%1d", gain+3); */
        sprintf (msg, "gain command: <%s>", aString);
        DEBUG_PRINT(5, msg);
        SEND (aString);
        SEND(K428_CMD_SAVE_TO_EEPROM);
        PVPUT(totalgain, pow (10, 3 + gain + x10));
        sprintf (aString, "DEBUG: variable gain=%d", gain);
        DEBUG_PRINT (8, aString);
        sprintf (aString, "DEBUG: variable x10=%d", x10);
        DEBUG_PRINT (8, aString);
        sprintf (aString, "DEBUG: variable totalgain=%e", totalgain);
        DEBUG_PRINT (8, aString);
%%	BUILD_DISPLAY_BUFFER;
        pvPut (displayBuffer);
        LUFT_PAUSE;
        efClear (gain_mon);
    } state idle

    when ( efTest (supprD_mon) || efTest (supprM_mon) ) {
        NEW_MSG("changed suppression");
        if (efTest (supprD_mon))  {
          DEBUG_PRINT (3, "supprD changed");
        }
        if (efTest (supprM_mon)) {
          DEBUG_PRINT (3, "supprM changed");
          /*
           *  kludge trap here to avoid underflow
           */
          sprintf (aString, "%.3f", supprM);
          sscanf (aString, "%g", &supprM);
          if (supprM >  5) supprM =  5;
          if (supprM < -5) supprM = -5;
          pvPut (supprM);
        }
        /*
         * ignore use_autoSuppr for now
         */
        if (supprM == 0.0) {
          strcpy (aString, "S0,0");
        } else {
          aShort = supprD - 9;
          sprintf (aString, "S%.3fE%d,0", supprM, aShort);
        }
        sprintf (msg, "suppression command: <%s>", aString);
        DEBUG_PRINT(5, msg);
        SEND (aString);
        SEND(K428_CMD_SAVE_TO_EEPROM);
        /*
         *  set the suppression value here
         *  in lieu of reading the value from the K428
         */
        sscanf (aString + 1, "%g", &suppression);
        pvPut (suppression);
%%	BUILD_DISPLAY_BUFFER;
        pvPut (displayBuffer);
        LUFT_PAUSE;
        efClear (supprD_mon);
        efClear (supprM_mon);
    } state idle

    when (efTest (risetime_mon)) {
      NEW_MSG("changed rise time");
      DEBUG_PRINT (3, "risetime changed");
        sprintf (aString, "T%1d", risetime);
        sprintf (msg, "risetime index: <%s>", aString);
        DEBUG_PRINT(5, msg);
        SEND (aString);
        SEND(K428_CMD_SAVE_TO_EEPROM);
%%	BUILD_DISPLAY_BUFFER;
        pvPut (displayBuffer);
        LUFT_PAUSE;
        efClear (risetime_mon);
    } state idle

    when (efTest (bias_mon)) {
      NEW_MSG("changed bias");
        DEBUG_PRINT(3, "bias changed");
        sprintf (aString, "V%.3f", bias);
        sscanf (aString, "%g", &bias);   /* avoid roundoff errors */
        if (bias >  5) bias =  5;
        if (bias < -5) bias = -5;
        pvPut (bias);
        sprintf (msg, "bias command: <%s>", aString);
        DEBUG_PRINT(5, msg);
        SEND (aString);
        SEND(K428_CMD_SAVE_TO_EEPROM);
%%	BUILD_DISPLAY_BUFFER;
        pvPut (displayBuffer);
        PVPUT (biasRdbk, bias);  /* provisional */
        LUFT_PAUSE;
        efClear (bias_mon);
    } state idle

    when (efTest (x10_mon)) {
      NEW_MSG("changed gain");
        DEBUG_PRINT(3, "command W");
        sprintf (aString, "W%1d", x10);
        sprintf (msg, "x10 command: <%s>", aString);
        DEBUG_PRINT(5, msg);
        SEND (aString);
        SEND(K428_CMD_SAVE_TO_EEPROM);
        PVPUT(totalgain, pow (10, 3 + gain + x10)); /* provisional */
%%	BUILD_DISPLAY_BUFFER;
        pvPut (displayBuffer);
        LUFT_PAUSE;
        efClear (x10_mon);
    } state idle

    when (efTest (autofilter_mon)) {
      NEW_MSG("changed filter mode");
        DEBUG_PRINT (3, "autofilter changed");
        sprintf (aString, "Z%1d", autofilter);
        sprintf (msg, "autofilter index: <%s>", aString);
        DEBUG_PRINT(5, msg);
        SEND (aString);
	SEND(K428_CMD_SAVE_TO_EEPROM);
        LUFT_PAUSE;
        efClear (autofilter_mon);
    } state idle

    when (efTest (display_mon)) {
        DEBUG_PRINT (3, "Display changed");
        sprintf (aString, "D%s", display);
        sprintf (msg, "display command: <%s>", aString);
        DEBUG_PRINT(5, msg);
        SEND (aString);
%%	BUILD_DISPLAY_BUFFER;
        pvPut (displayBuffer);
        LUFT_PAUSE;
        efClear (display_mon);
    } state idle

    when (delay (DISPLAY_UPDATE_PERIOD_S)) {
        /* is device online?  update the display with info */
        DEBUG_PRINT(3, "device idle; change display");
%{
       pVar->displayBufferIndex = getNextK428Display (
          pVar->displayBuffer, 
	  pVar->displayBufferLength, 
	  pVar->displayBufferIndex, 
	  pVar->msg);
}%
        NEW_MSG (msg);
        sprintf (aString, "D%s", msg);
        SEND (aString);
	DEBUG_PRINT(10, aString);
        efSet (cmd_U1);  /* read the error status word */
    } state idle


  } /* state idle */

  /******************************** 
   ********************************  KeithleyToEPICS
   ********************************/
  state KeithleyToEPICS {
    when () {

      DEBUG_PRINT(3, "Keithley -> EPICS");

      /*
       * Default Output Word
       */
      SEND_RECEIVE(K428_CMD_SEND_SUPPRESS_VALUE, buffer);
      epicsThreadSleep(0.25);
        sscanf (buffer +  4, "%g",  &suppression);
        sscanf (buffer +  4, "%6f", &supprM);
%%      pVar->supprD  = extract_int (pVar->buffer, 11, 3);
        	supprD += 9;
        pvPut (suppression);
        pvPut (supprM);
        pvPut (supprD);
        efClear (supprM_mon);
        efClear (supprD_mon);

      /*
       * Machine Status Word
       */
      SEND_RECEIVE(K428_CMD_SEND_MACH_STATUS_WORD, buffer);
      epicsThreadSleep(0.167);
%%      pVar->brightness	= extract_int (pVar->buffer,  4, 1);	/* A */
%%      pVar->use_bias		= extract_int (pVar->buffer,  6, 1);	/* B */
%%      pVar->zero_check	= extract_int (pVar->buffer,  8, 1);	/* C */
%%      pVar->self_test_result	= extract_int (pVar->buffer, 13, 1);	/* J */
%%      pVar->aShort		= extract_int (pVar->buffer, 15, 1);	/* K */
        	EOI     = !(aShort % 2);
        	holdoff = !(aShort / 2);
%%      pVar->autoSupp		= extract_int (pVar->buffer, 21, 1);	/* N */
%%      pVar->filter		= extract_int (pVar->buffer, 23, 1);	/* P */
%%      pVar->gain		= extract_int (pVar->buffer, 25, 2);	/* R */
        	gain -= 3;
%%      pVar->risetime		= extract_int (pVar->buffer, 31, 1);	/* T */
%%      pVar->x10		= extract_int (pVar->buffer, 33, 1);	/* W */
%%      pVar->autofilter	= extract_int (pVar->buffer, 37, 1);	/* Z */

        pvPut (brightness);
        pvPut (use_bias);
        pvPut (zero_check);
        pvPut (self_test_result);
        pvPut (EOI);
        pvPut (holdoff);
        pvPut (autoSupp);
        pvPut (filter);
        pvPut (gain);
        pvPut (risetime);
        pvPut (x10);
        pvPut (filter);

        efClear (brightness_mon);
        efClear (use_bias_mon);
        efClear (zero_check_mon);
        efClear (autoSupp_mon);
        efClear (filter_mon);
        efClear (gain_mon);
        efClear (risetime_mon);
        efClear (x10_mon);
        efClear (autofilter_mon);

      /*
       * Error Status Word
       */
      SEND_RECEIVE(K428_CMD_SEND_ERR_STATUS_WORD, buffer);
%%      pVar->err_IDDC             = extract_int (pVar->buffer,  3, 1);
%%      pVar->err_IDDCO            = extract_int (pVar->buffer,  4, 1);
%%      pVar->err_not_in_remote    = extract_int (pVar->buffer,  5, 1);
%%      pVar->err_self_test_failed = extract_int (pVar->buffer,  6, 1);
%%      pVar->err_supp_range_val   = extract_int (pVar->buffer,  7, 1);
%%      pVar->err_input_current    = extract_int (pVar->buffer,  8, 1);
%%      pVar->err_autosuppression  = extract_int (pVar->buffer,  9, 1);
%%      pVar->err_zero_correction  = extract_int (pVar->buffer, 10, 1);
%%      pVar->err_EEPROM           = extract_int (pVar->buffer, 11, 1);
%%      pVar->err_overload         = extract_int (pVar->buffer, 12, 1);
%%      pVar->err_gain_risetime    = extract_int (pVar->buffer, 13, 1);
        pvPut (err_IDDC);
        pvPut (err_IDDCO);
        pvPut (err_not_in_remote);
        pvPut (err_self_test_failed);
        pvPut (err_supp_range_val);
        pvPut (err_input_current);
        pvPut (err_autosuppression);
        pvPut (err_zero_correction);
        pvPut (err_EEPROM);
        pvPut (err_overload);
        pvPut (err_gain_risetime);

      /*
       * Voltage Bias Value Word
       */
      SEND_RECEIVE(K428_CMD_SEND_BIAS_VALUE, buffer);
      epicsThreadSleep(0.167);
        sscanf (buffer + 1, "%g", &bias);
        pvPut (bias);
        PVPUT (biasRdbk, bias);
        efClear (bias_mon);

      /*
       * Total Gain Word
       */
      SEND_RECEIVE(K428_CMD_SEND_TOTAL_GAIN, buffer);
      epicsThreadSleep(0.167);
        sscanf (buffer, "%g", &totalgain);
        pvPut (totalgain);

      /*
       * Model Number and Firmware Revision Word
       */
      SEND_RECEIVE(K428_CMD_SEND_MODEL_NUM_REV, buffer);
      /* ignore */

    } state idle
  } /* state KeithleyToEPICS */

  /******************************** 
   ********************************  EPICStoKeithley
   ********************************/
  state EPICStoKeithley {
    when () {
      DEBUG_PRINT(3, "EPICS -> Keithley");
      efSet (supprM_mon);
      efSet (supprD_mon);
      efSet (brightness_mon);
      efSet (use_bias_mon);
      efSet (zero_check_mon);
      efSet (autoSupp_mon);
      efSet (filter_mon);
      efSet (gain_mon);
      efSet (risetime_mon);
      efSet (x10_mon);
      efSet (autofilter_mon);
      efSet (bias_mon);
    } state idle
  } /* state EPICStoKeithley */

} /* ss: input */



/************************************************************************** 
 ********************         C functions        **************************
 **************************************************************************/
%{

static int extract_int (char *source, int start, int qty)
{
        int answer;
        char format[256];

        if (start > 0) sprintf (format, "%s%dc%s%dd", "%*", start, "%", qty);
                  else sprintf (format, "%s%dd", "%", qty);
        sscanf (source, format, &answer);
    /*  printf ( "     <%s>, %d, %d --> %d\n", source, start, qty, answer); /**/
        return (answer);
}

static int getNextK428Display (char *buf, int bufLen, int oldIndex, char *display)
{
        int  i;
        char c;
	int  index;

	/* increment the index and wrap it around */
        index = (oldIndex + 1) % bufLen;  
	for (i=0; i<K428_DISPLAY_SIZE; i++) {
	  c = buf[(index + i) % bufLen];
	  /* on K428 uppercase X indicates "end of command" */
	  display[i] = (c != 'X') ? c : 'x';
	}
	display[i] = 0;  /* end of string */
        return (index);
}

}%

