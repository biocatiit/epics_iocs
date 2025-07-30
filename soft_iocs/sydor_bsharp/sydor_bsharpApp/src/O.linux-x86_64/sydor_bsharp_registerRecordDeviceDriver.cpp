/* THIS IS A GENERATED FILE. DO NOT EDIT! */
/* Generated from ../O.Common/sydor_bsharp.dbd */

#include <string.h>
#ifndef USE_TYPED_RSET
#  define USE_TYPED_RSET
#endif
#include "compilerDependencies.h"
#include "epicsStdlib.h"
#include "iocsh.h"
#include "iocshRegisterCommon.h"
#include "registryCommon.h"
#include "recSup.h"
#include "shareLib.h"

extern "C" {

epicsShareExtern typed_rset *pvar_rset_aSubRSET, *pvar_rset_aaiRSET,
    *pvar_rset_aaoRSET, *pvar_rset_acalcoutRSET, *pvar_rset_aiRSET,
    *pvar_rset_aoRSET, *pvar_rset_asynRSET, *pvar_rset_biRSET,
    *pvar_rset_boRSET, *pvar_rset_busyRSET, *pvar_rset_calcRSET,
    *pvar_rset_calcoutRSET, *pvar_rset_compressRSET,
    *pvar_rset_dfanoutRSET, *pvar_rset_digitelRSET, *pvar_rset_epidRSET,
    *pvar_rset_eventRSET, *pvar_rset_fanoutRSET, *pvar_rset_histogramRSET,
    *pvar_rset_int64inRSET, *pvar_rset_int64outRSET,
    *pvar_rset_longinRSET, *pvar_rset_longoutRSET, *pvar_rset_lsiRSET,
    *pvar_rset_lsoRSET, *pvar_rset_luascriptRSET, *pvar_rset_mbbiRSET,
    *pvar_rset_mbbiDirectRSET, *pvar_rset_mbboRSET,
    *pvar_rset_mbboDirectRSET, *pvar_rset_mcaRSET, *pvar_rset_motorRSET,
    *pvar_rset_permissiveRSET, *pvar_rset_printfRSET,
    *pvar_rset_scalcoutRSET, *pvar_rset_scalerRSET,
    *pvar_rset_scanparmRSET, *pvar_rset_selRSET, *pvar_rset_seqRSET,
    *pvar_rset_sscanRSET, *pvar_rset_sseqRSET, *pvar_rset_stateRSET,
    *pvar_rset_stringinRSET, *pvar_rset_stringoutRSET, *pvar_rset_subRSET,
    *pvar_rset_subArrayRSET, *pvar_rset_swaitRSET, *pvar_rset_tableRSET,
    *pvar_rset_throttleRSET, *pvar_rset_timestampRSET,
    *pvar_rset_transformRSET, *pvar_rset_vsRSET, *pvar_rset_waveformRSET;

typedef int (*rso_func)(dbRecordType *pdbRecordType);
epicsShareExtern rso_func pvar_func_aSubRecordSizeOffset,
    pvar_func_aaiRecordSizeOffset, pvar_func_aaoRecordSizeOffset,
    pvar_func_acalcoutRecordSizeOffset, pvar_func_aiRecordSizeOffset,
    pvar_func_aoRecordSizeOffset, pvar_func_asynRecordSizeOffset,
    pvar_func_biRecordSizeOffset, pvar_func_boRecordSizeOffset,
    pvar_func_busyRecordSizeOffset, pvar_func_calcRecordSizeOffset,
    pvar_func_calcoutRecordSizeOffset, pvar_func_compressRecordSizeOffset,
    pvar_func_dfanoutRecordSizeOffset, pvar_func_digitelRecordSizeOffset,
    pvar_func_epidRecordSizeOffset, pvar_func_eventRecordSizeOffset,
    pvar_func_fanoutRecordSizeOffset, pvar_func_histogramRecordSizeOffset,
    pvar_func_int64inRecordSizeOffset, pvar_func_int64outRecordSizeOffset,
    pvar_func_longinRecordSizeOffset, pvar_func_longoutRecordSizeOffset,
    pvar_func_lsiRecordSizeOffset, pvar_func_lsoRecordSizeOffset,
    pvar_func_luascriptRecordSizeOffset, pvar_func_mbbiRecordSizeOffset,
    pvar_func_mbbiDirectRecordSizeOffset, pvar_func_mbboRecordSizeOffset,
    pvar_func_mbboDirectRecordSizeOffset, pvar_func_mcaRecordSizeOffset,
    pvar_func_motorRecordSizeOffset, pvar_func_permissiveRecordSizeOffset,
    pvar_func_printfRecordSizeOffset, pvar_func_scalcoutRecordSizeOffset,
    pvar_func_scalerRecordSizeOffset, pvar_func_scanparmRecordSizeOffset,
    pvar_func_selRecordSizeOffset, pvar_func_seqRecordSizeOffset,
    pvar_func_sscanRecordSizeOffset, pvar_func_sseqRecordSizeOffset,
    pvar_func_stateRecordSizeOffset, pvar_func_stringinRecordSizeOffset,
    pvar_func_stringoutRecordSizeOffset, pvar_func_subRecordSizeOffset,
    pvar_func_subArrayRecordSizeOffset, pvar_func_swaitRecordSizeOffset,
    pvar_func_tableRecordSizeOffset, pvar_func_throttleRecordSizeOffset,
    pvar_func_timestampRecordSizeOffset,
    pvar_func_transformRecordSizeOffset, pvar_func_vsRecordSizeOffset,
    pvar_func_waveformRecordSizeOffset;

static const char * const recordTypeNames[] = {
    "aSub", "aai", "aao", "acalcout", "ai", "ao", "asyn", "bi", "bo",
    "busy", "calc", "calcout", "compress", "dfanout", "digitel", "epid",
    "event", "fanout", "histogram", "int64in", "int64out", "longin",
    "longout", "lsi", "lso", "luascript", "mbbi", "mbbiDirect", "mbbo",
    "mbboDirect", "mca", "motor", "permissive", "printf", "scalcout",
    "scaler", "scanparm", "sel", "seq", "sscan", "sseq", "state",
    "stringin", "stringout", "sub", "subArray", "swait", "table",
    "throttle", "timestamp", "transform", "vs", "waveform"
};

static const recordTypeLocation rtl[] = {
    {(struct typed_rset *)pvar_rset_aSubRSET, pvar_func_aSubRecordSizeOffset},
    {(struct typed_rset *)pvar_rset_aaiRSET, pvar_func_aaiRecordSizeOffset},
    {(struct typed_rset *)pvar_rset_aaoRSET, pvar_func_aaoRecordSizeOffset},
    {(struct typed_rset *)pvar_rset_acalcoutRSET, pvar_func_acalcoutRecordSizeOffset},
    {(struct typed_rset *)pvar_rset_aiRSET, pvar_func_aiRecordSizeOffset},
    {(struct typed_rset *)pvar_rset_aoRSET, pvar_func_aoRecordSizeOffset},
    {(struct typed_rset *)pvar_rset_asynRSET, pvar_func_asynRecordSizeOffset},
    {(struct typed_rset *)pvar_rset_biRSET, pvar_func_biRecordSizeOffset},
    {(struct typed_rset *)pvar_rset_boRSET, pvar_func_boRecordSizeOffset},
    {(struct typed_rset *)pvar_rset_busyRSET, pvar_func_busyRecordSizeOffset},
    {(struct typed_rset *)pvar_rset_calcRSET, pvar_func_calcRecordSizeOffset},
    {(struct typed_rset *)pvar_rset_calcoutRSET, pvar_func_calcoutRecordSizeOffset},
    {(struct typed_rset *)pvar_rset_compressRSET, pvar_func_compressRecordSizeOffset},
    {(struct typed_rset *)pvar_rset_dfanoutRSET, pvar_func_dfanoutRecordSizeOffset},
    {(struct typed_rset *)pvar_rset_digitelRSET, pvar_func_digitelRecordSizeOffset},
    {(struct typed_rset *)pvar_rset_epidRSET, pvar_func_epidRecordSizeOffset},
    {(struct typed_rset *)pvar_rset_eventRSET, pvar_func_eventRecordSizeOffset},
    {(struct typed_rset *)pvar_rset_fanoutRSET, pvar_func_fanoutRecordSizeOffset},
    {(struct typed_rset *)pvar_rset_histogramRSET, pvar_func_histogramRecordSizeOffset},
    {(struct typed_rset *)pvar_rset_int64inRSET, pvar_func_int64inRecordSizeOffset},
    {(struct typed_rset *)pvar_rset_int64outRSET, pvar_func_int64outRecordSizeOffset},
    {(struct typed_rset *)pvar_rset_longinRSET, pvar_func_longinRecordSizeOffset},
    {(struct typed_rset *)pvar_rset_longoutRSET, pvar_func_longoutRecordSizeOffset},
    {(struct typed_rset *)pvar_rset_lsiRSET, pvar_func_lsiRecordSizeOffset},
    {(struct typed_rset *)pvar_rset_lsoRSET, pvar_func_lsoRecordSizeOffset},
    {(struct typed_rset *)pvar_rset_luascriptRSET, pvar_func_luascriptRecordSizeOffset},
    {(struct typed_rset *)pvar_rset_mbbiRSET, pvar_func_mbbiRecordSizeOffset},
    {(struct typed_rset *)pvar_rset_mbbiDirectRSET, pvar_func_mbbiDirectRecordSizeOffset},
    {(struct typed_rset *)pvar_rset_mbboRSET, pvar_func_mbboRecordSizeOffset},
    {(struct typed_rset *)pvar_rset_mbboDirectRSET, pvar_func_mbboDirectRecordSizeOffset},
    {(struct typed_rset *)pvar_rset_mcaRSET, pvar_func_mcaRecordSizeOffset},
    {(struct typed_rset *)pvar_rset_motorRSET, pvar_func_motorRecordSizeOffset},
    {(struct typed_rset *)pvar_rset_permissiveRSET, pvar_func_permissiveRecordSizeOffset},
    {(struct typed_rset *)pvar_rset_printfRSET, pvar_func_printfRecordSizeOffset},
    {(struct typed_rset *)pvar_rset_scalcoutRSET, pvar_func_scalcoutRecordSizeOffset},
    {(struct typed_rset *)pvar_rset_scalerRSET, pvar_func_scalerRecordSizeOffset},
    {(struct typed_rset *)pvar_rset_scanparmRSET, pvar_func_scanparmRecordSizeOffset},
    {(struct typed_rset *)pvar_rset_selRSET, pvar_func_selRecordSizeOffset},
    {(struct typed_rset *)pvar_rset_seqRSET, pvar_func_seqRecordSizeOffset},
    {(struct typed_rset *)pvar_rset_sscanRSET, pvar_func_sscanRecordSizeOffset},
    {(struct typed_rset *)pvar_rset_sseqRSET, pvar_func_sseqRecordSizeOffset},
    {(struct typed_rset *)pvar_rset_stateRSET, pvar_func_stateRecordSizeOffset},
    {(struct typed_rset *)pvar_rset_stringinRSET, pvar_func_stringinRecordSizeOffset},
    {(struct typed_rset *)pvar_rset_stringoutRSET, pvar_func_stringoutRecordSizeOffset},
    {(struct typed_rset *)pvar_rset_subRSET, pvar_func_subRecordSizeOffset},
    {(struct typed_rset *)pvar_rset_subArrayRSET, pvar_func_subArrayRecordSizeOffset},
    {(struct typed_rset *)pvar_rset_swaitRSET, pvar_func_swaitRecordSizeOffset},
    {(struct typed_rset *)pvar_rset_tableRSET, pvar_func_tableRecordSizeOffset},
    {(struct typed_rset *)pvar_rset_throttleRSET, pvar_func_throttleRecordSizeOffset},
    {(struct typed_rset *)pvar_rset_timestampRSET, pvar_func_timestampRecordSizeOffset},
    {(struct typed_rset *)pvar_rset_transformRSET, pvar_func_transformRecordSizeOffset},
    {(struct typed_rset *)pvar_rset_vsRSET, pvar_func_vsRecordSizeOffset},
    {(struct typed_rset *)pvar_rset_waveformRSET, pvar_func_waveformRecordSizeOffset}
};

epicsShareExtern dset *pvar_dset_devAaiSoft, *pvar_dset_asynInt8ArrayAai,
    *pvar_dset_asynInt16ArrayAai, *pvar_dset_asynInt32ArrayAai,
    *pvar_dset_asynFloat32ArrayAai, *pvar_dset_asynFloat64ArrayAai,
    *pvar_dset_asynInt64ArrayAai, *pvar_dset_devaaiStream,
    *pvar_dset_devAaoSoft, *pvar_dset_asynInt8ArrayAao,
    *pvar_dset_asynInt16ArrayAao, *pvar_dset_asynInt32ArrayAao,
    *pvar_dset_asynFloat32ArrayAao, *pvar_dset_asynFloat64ArrayAao,
    *pvar_dset_asynInt64ArrayAao, *pvar_dset_devaaoStream,
    *pvar_dset_devaCalcoutSoft, *pvar_dset_devAiSoft,
    *pvar_dset_devAiSoftRaw, *pvar_dset_devAiSoftCallback,
    *pvar_dset_devTimestampAI, *pvar_dset_devAiGeneralTime,
    *pvar_dset_asynAiInt32, *pvar_dset_asynAiInt32Average,
    *pvar_dset_asynAiFloat64, *pvar_dset_asynAiFloat64Average,
    *pvar_dset_asynAiInt64, *pvar_dset_devAiStats, *pvar_dset_devAiClusts,
    *pvar_dset_devGpib, *pvar_dset_devAiTodSeconds,
    *pvar_dset_devAiStrParm, *pvar_dset_devAiHeidND261,
    *pvar_dset_devAiMKS, *pvar_dset_devAiMPC, *pvar_dset_devAiGP307Gpib,
    *pvar_dset_devAiAX301, *pvar_dset_devAiTelevac,
    *pvar_dset_devAiTPG261, *pvar_dset_devLuaAi, *pvar_dset_devaiStream,
    *pvar_dset_devAidg535, *pvar_dset_devAiEtherIP,
    *pvar_dset_devMW100_ai, *pvar_dset_devAoSoft, *pvar_dset_devAoSoftRaw,
    *pvar_dset_devAoSoftCallback, *pvar_dset_asynAoInt32,
    *pvar_dset_asynAoFloat64, *pvar_dset_asynAoInt64,
    *pvar_dset_devAoStats, *pvar_dset_devAoStrParm,
    *pvar_dset_devAoEurotherm, *pvar_dset_devAoMPC, *pvar_dset_devAoAX301,
    *pvar_dset_devAoTPG261, *pvar_dset_devLuaAo, *pvar_dset_devaoStream,
    *pvar_dset_devAodg535, *pvar_dset_devAoEtherIP,
    *pvar_dset_devMW100_ao, *pvar_dset_asynRecordDevice,
    *pvar_dset_devBiSoft, *pvar_dset_devBiSoftRaw,
    *pvar_dset_devBiSoftCallback, *pvar_dset_devBiDbState,
    *pvar_dset_asynBiInt32, *pvar_dset_asynBiUInt32Digital,
    *pvar_dset_devBiStrParm, *pvar_dset_devBiMPC,
    *pvar_dset_devBiGP307Gpib, *pvar_dset_devBiTelevac,
    *pvar_dset_devBiTPG261, *pvar_dset_devLuaBi, *pvar_dset_devbiStream,
    *pvar_dset_devBidg535, *pvar_dset_devBiEtherIP,
    *pvar_dset_devMW100_bi, *pvar_dset_devBoSoft, *pvar_dset_devBoSoftRaw,
    *pvar_dset_devBoSoftCallback, *pvar_dset_devBoGeneralTime,
    *pvar_dset_devBoDbState, *pvar_dset_asynBoInt32,
    *pvar_dset_asynBoUInt32Digital, *pvar_dset_devBoStrParm,
    *pvar_dset_devBoMPC, *pvar_dset_devBoGP307Gpib, *pvar_dset_devBoAX301,
    *pvar_dset_devBoTPG261, *pvar_dset_devLuaBo, *pvar_dset_devboStream,
    *pvar_dset_devBodg535, *pvar_dset_devBoEtherIP,
    *pvar_dset_softGlueShow, *pvar_dset_devMW100_bo,
    *pvar_dset_devBusySoft, *pvar_dset_devBusySoftRaw,
    *pvar_dset_asynBusyInt32, *pvar_dset_devCalcoutSoft,
    *pvar_dset_devCalcoutSoftCallback, *pvar_dset_devcalcoutStream,
    *pvar_dset_devDigitelPump, *pvar_dset_devEpidSoft,
    *pvar_dset_devEpidSoftCB, *pvar_dset_devEpidFast,
    *pvar_dset_devEventSoft, *pvar_dset_devHistogramSoft,
    *pvar_dset_devI64inSoft, *pvar_dset_devI64inSoftCallback,
    *pvar_dset_asynInt64In, *pvar_dset_devint64inStream,
    *pvar_dset_devI64outSoft, *pvar_dset_devI64outSoftCallback,
    *pvar_dset_asynInt64Out, *pvar_dset_devint64outStream,
    *pvar_dset_devLiSoft, *pvar_dset_devLiSoftCallback,
    *pvar_dset_devLiGeneralTime, *pvar_dset_asynLiInt32,
    *pvar_dset_asynLiUInt32Digital, *pvar_dset_asynLiInt64,
    *pvar_dset_devLiStrParm, *pvar_dset_devLuaLongin,
    *pvar_dset_devlonginStream, *pvar_dset_devLidg535,
    *pvar_dset_devMW100_longin, *pvar_dset_devLoSoft,
    *pvar_dset_devLoSoftCallback, *pvar_dset_asynLoInt32,
    *pvar_dset_asynLoUInt32Digital, *pvar_dset_asynLoInt64,
    *pvar_dset_devLoStrParm, *pvar_dset_devLoAX301,
    *pvar_dset_devLuaLongout, *pvar_dset_devlongoutStream,
    *pvar_dset_devLodg535, *pvar_dset_softGlueSigNum,
    *pvar_dset_devLsiSoft, *pvar_dset_devLsiEnviron,
    *pvar_dset_asynLsiOctetCmdResponse, *pvar_dset_asynLsiOctetWriteRead,
    *pvar_dset_asynLsiOctetRead, *pvar_dset_devlsiStream,
    *pvar_dset_devLsiEtherIP, *pvar_dset_devLsoSoft,
    *pvar_dset_devLsoSoftCallback, *pvar_dset_devLsoStdio,
    *pvar_dset_asynLsoOctetWrite, *pvar_dset_devlsoStream,
    *pvar_dset_devLsoEtherIP, *pvar_dset_devLuaSoft,
    *pvar_dset_devMbbiSoft, *pvar_dset_devMbbiSoftRaw,
    *pvar_dset_devMbbiSoftCallback, *pvar_dset_asynMbbiInt32,
    *pvar_dset_asynMbbiUInt32Digital, *pvar_dset_devMbbiTPG261,
    *pvar_dset_devLuaMbbi, *pvar_dset_devmbbiStream,
    *pvar_dset_devMbbidg535, *pvar_dset_devMbbiEtherIP,
    *pvar_dset_devMW100_mbbi, *pvar_dset_devMbbiDirectSoft,
    *pvar_dset_devMbbiDirectSoftRaw, *pvar_dset_devMbbiDirectSoftCallback,
    *pvar_dset_asynMbbiDirectUInt32Digital,
    *pvar_dset_devmbbiDirectStream, *pvar_dset_devMbbiDirectEtherIP,
    *pvar_dset_devMbboSoft, *pvar_dset_devMbboSoftRaw,
    *pvar_dset_devMbboSoftCallback, *pvar_dset_asynMbboInt32,
    *pvar_dset_asynMbboUInt32Digital, *pvar_dset_devMbboMPC,
    *pvar_dset_devMbboTPG261, *pvar_dset_devLuaMbbo,
    *pvar_dset_devmbboStream, *pvar_dset_devMbbodg535,
    *pvar_dset_devMbboEtherIP, *pvar_dset_devMW100_mbbo,
    *pvar_dset_devMbboDirectSoft, *pvar_dset_devMbboDirectSoftRaw,
    *pvar_dset_devMbboDirectSoftCallback,
    *pvar_dset_asynMbboDirectUInt32Digital,
    *pvar_dset_devmbboDirectStream, *pvar_dset_devMbboDirectEtherIP,
    *pvar_dset_devMCA_soft, *pvar_dset_devMcaAsyn,
    *pvar_dset_devMotorAsyn, *pvar_dset_devMCB4B, *pvar_dset_devSoloist,
    *pvar_dset_devMCDC2805, *pvar_dset_devIM483SM, *pvar_dset_devIM483PL,
    *pvar_dset_devMDrive, *pvar_dset_devSC800, *pvar_dset_devPM304,
    *pvar_dset_devMicos, *pvar_dset_devMVP2001, *pvar_dset_devPMNC87xx,
    *pvar_dset_devMM3000, *pvar_dset_devMM4000, *pvar_dset_devPM500,
    *pvar_dset_devESP300, *pvar_dset_devEMC18011, *pvar_dset_devPC6K,
    *pvar_dset_devPIJEDS, *pvar_dset_devPIC844, *pvar_dset_devPIC630,
    *pvar_dset_devPIC848, *pvar_dset_devPIC662, *pvar_dset_devPIC862,
    *pvar_dset_devPIC663, *pvar_dset_devPIE710, *pvar_dset_devPIE516,
    *pvar_dset_devPIE517, *pvar_dset_devPIE816, *pvar_dset_devSPiiPlus,
    *pvar_dset_devSmartMotor, *pvar_dset_devMotorSoft,
    *pvar_dset_devMDT695, *pvar_dset_devMotorSim,
    *pvar_dset_devPrintfSoft, *pvar_dset_devPrintfSoftCallback,
    *pvar_dset_devPrintfStdio, *pvar_dset_asynPfOctetWrite,
    *pvar_dset_devsCalcoutSoft, *pvar_dset_devscalcoutStream,
    *pvar_dset_devScalerAsyn, *pvar_dset_devSiSoft,
    *pvar_dset_devSiSoftCallback, *pvar_dset_devTimestampSI,
    *pvar_dset_devSiGeneralTime, *pvar_dset_devSiEnviron,
    *pvar_dset_asynSiOctetCmdResponse, *pvar_dset_asynSiOctetWriteRead,
    *pvar_dset_asynSiOctetRead, *pvar_dset_devStringinStats,
    *pvar_dset_devStringinEnvVar, *pvar_dset_devStringinEpics,
    *pvar_dset_devSiTodString, *pvar_dset_devSiStrParm,
    *pvar_dset_devSiMPC, *pvar_dset_devSiGP307Gpib,
    *pvar_dset_devSiTPG261, *pvar_dset_devLuaStringin,
    *pvar_dset_devstringinStream, *pvar_dset_devSidg535,
    *pvar_dset_devSiEtherIP, *pvar_dset_devMW100_stringin,
    *pvar_dset_devSoSoft, *pvar_dset_devSoSoftCallback,
    *pvar_dset_devSoStdio, *pvar_dset_asynSoOctetWrite,
    *pvar_dset_devSoStrParm, *pvar_dset_devSoEurotherm,
    *pvar_dset_devSoMPC, *pvar_dset_devLuaStringout,
    *pvar_dset_devstringoutStream, *pvar_dset_devSodg535,
    *pvar_dset_devSoEtherIP, *pvar_dset_asynSoftGlue,
    *pvar_dset_devSASoft, *pvar_dset_devSWaitIoEvent,
    *pvar_dset_devVacSen, *pvar_dset_devWfSoft,
    *pvar_dset_asynWfOctetCmdResponse, *pvar_dset_asynWfOctetWriteRead,
    *pvar_dset_asynWfOctetRead, *pvar_dset_asynWfOctetWrite,
    *pvar_dset_asynWfOctetWriteBinary, *pvar_dset_asynInt8ArrayWfIn,
    *pvar_dset_asynInt8ArrayWfOut, *pvar_dset_asynInt16ArrayWfIn,
    *pvar_dset_asynInt16ArrayWfOut, *pvar_dset_asynInt32ArrayWfIn,
    *pvar_dset_asynInt32ArrayWfOut, *pvar_dset_asynFloat32ArrayWfIn,
    *pvar_dset_asynFloat32ArrayWfOut, *pvar_dset_asynFloat64ArrayWfIn,
    *pvar_dset_asynFloat64ArrayWfOut, *pvar_dset_asynInt32TimeSeries,
    *pvar_dset_asynFloat64TimeSeries, *pvar_dset_asynInt64ArrayWfIn,
    *pvar_dset_asynInt64ArrayWfOut, *pvar_dset_asynInt64TimeSeries,
    *pvar_dset_devWaveformStats, *pvar_dset_devwaveformStream,
    *pvar_dset_devWfEtherIP;

static const char * const deviceSupportNames[] = {
    "devAaiSoft", "asynInt8ArrayAai", "asynInt16ArrayAai",
    "asynInt32ArrayAai", "asynFloat32ArrayAai", "asynFloat64ArrayAai",
    "asynInt64ArrayAai", "devaaiStream", "devAaoSoft", "asynInt8ArrayAao",
    "asynInt16ArrayAao", "asynInt32ArrayAao", "asynFloat32ArrayAao",
    "asynFloat64ArrayAao", "asynInt64ArrayAao", "devaaoStream",
    "devaCalcoutSoft", "devAiSoft", "devAiSoftRaw", "devAiSoftCallback",
    "devTimestampAI", "devAiGeneralTime", "asynAiInt32",
    "asynAiInt32Average", "asynAiFloat64", "asynAiFloat64Average",
    "asynAiInt64", "devAiStats", "devAiClusts", "devGpib",
    "devAiTodSeconds", "devAiStrParm", "devAiHeidND261", "devAiMKS",
    "devAiMPC", "devAiGP307Gpib", "devAiAX301", "devAiTelevac",
    "devAiTPG261", "devLuaAi", "devaiStream", "devAidg535",
    "devAiEtherIP", "devMW100_ai", "devAoSoft", "devAoSoftRaw",
    "devAoSoftCallback", "asynAoInt32", "asynAoFloat64", "asynAoInt64",
    "devAoStats", "devAoStrParm", "devAoEurotherm", "devAoMPC",
    "devAoAX301", "devAoTPG261", "devLuaAo", "devaoStream", "devAodg535",
    "devAoEtherIP", "devMW100_ao", "asynRecordDevice", "devBiSoft",
    "devBiSoftRaw", "devBiSoftCallback", "devBiDbState", "asynBiInt32",
    "asynBiUInt32Digital", "devBiStrParm", "devBiMPC", "devBiGP307Gpib",
    "devBiTelevac", "devBiTPG261", "devLuaBi", "devbiStream",
    "devBidg535", "devBiEtherIP", "devMW100_bi", "devBoSoft",
    "devBoSoftRaw", "devBoSoftCallback", "devBoGeneralTime",
    "devBoDbState", "asynBoInt32", "asynBoUInt32Digital", "devBoStrParm",
    "devBoMPC", "devBoGP307Gpib", "devBoAX301", "devBoTPG261", "devLuaBo",
    "devboStream", "devBodg535", "devBoEtherIP", "softGlueShow",
    "devMW100_bo", "devBusySoft", "devBusySoftRaw", "asynBusyInt32",
    "devCalcoutSoft", "devCalcoutSoftCallback", "devcalcoutStream",
    "devDigitelPump", "devEpidSoft", "devEpidSoftCB", "devEpidFast",
    "devEventSoft", "devHistogramSoft", "devI64inSoft",
    "devI64inSoftCallback", "asynInt64In", "devint64inStream",
    "devI64outSoft", "devI64outSoftCallback", "asynInt64Out",
    "devint64outStream", "devLiSoft", "devLiSoftCallback",
    "devLiGeneralTime", "asynLiInt32", "asynLiUInt32Digital",
    "asynLiInt64", "devLiStrParm", "devLuaLongin", "devlonginStream",
    "devLidg535", "devMW100_longin", "devLoSoft", "devLoSoftCallback",
    "asynLoInt32", "asynLoUInt32Digital", "asynLoInt64", "devLoStrParm",
    "devLoAX301", "devLuaLongout", "devlongoutStream", "devLodg535",
    "softGlueSigNum", "devLsiSoft", "devLsiEnviron",
    "asynLsiOctetCmdResponse", "asynLsiOctetWriteRead",
    "asynLsiOctetRead", "devlsiStream", "devLsiEtherIP", "devLsoSoft",
    "devLsoSoftCallback", "devLsoStdio", "asynLsoOctetWrite",
    "devlsoStream", "devLsoEtherIP", "devLuaSoft", "devMbbiSoft",
    "devMbbiSoftRaw", "devMbbiSoftCallback", "asynMbbiInt32",
    "asynMbbiUInt32Digital", "devMbbiTPG261", "devLuaMbbi",
    "devmbbiStream", "devMbbidg535", "devMbbiEtherIP", "devMW100_mbbi",
    "devMbbiDirectSoft", "devMbbiDirectSoftRaw",
    "devMbbiDirectSoftCallback", "asynMbbiDirectUInt32Digital",
    "devmbbiDirectStream", "devMbbiDirectEtherIP", "devMbboSoft",
    "devMbboSoftRaw", "devMbboSoftCallback", "asynMbboInt32",
    "asynMbboUInt32Digital", "devMbboMPC", "devMbboTPG261", "devLuaMbbo",
    "devmbboStream", "devMbbodg535", "devMbboEtherIP", "devMW100_mbbo",
    "devMbboDirectSoft", "devMbboDirectSoftRaw",
    "devMbboDirectSoftCallback", "asynMbboDirectUInt32Digital",
    "devmbboDirectStream", "devMbboDirectEtherIP", "devMCA_soft",
    "devMcaAsyn", "devMotorAsyn", "devMCB4B", "devSoloist", "devMCDC2805",
    "devIM483SM", "devIM483PL", "devMDrive", "devSC800", "devPM304",
    "devMicos", "devMVP2001", "devPMNC87xx", "devMM3000", "devMM4000",
    "devPM500", "devESP300", "devEMC18011", "devPC6K", "devPIJEDS",
    "devPIC844", "devPIC630", "devPIC848", "devPIC662", "devPIC862",
    "devPIC663", "devPIE710", "devPIE516", "devPIE517", "devPIE816",
    "devSPiiPlus", "devSmartMotor", "devMotorSoft", "devMDT695",
    "devMotorSim", "devPrintfSoft", "devPrintfSoftCallback",
    "devPrintfStdio", "asynPfOctetWrite", "devsCalcoutSoft",
    "devscalcoutStream", "devScalerAsyn", "devSiSoft",
    "devSiSoftCallback", "devTimestampSI", "devSiGeneralTime",
    "devSiEnviron", "asynSiOctetCmdResponse", "asynSiOctetWriteRead",
    "asynSiOctetRead", "devStringinStats", "devStringinEnvVar",
    "devStringinEpics", "devSiTodString", "devSiStrParm", "devSiMPC",
    "devSiGP307Gpib", "devSiTPG261", "devLuaStringin",
    "devstringinStream", "devSidg535", "devSiEtherIP",
    "devMW100_stringin", "devSoSoft", "devSoSoftCallback", "devSoStdio",
    "asynSoOctetWrite", "devSoStrParm", "devSoEurotherm", "devSoMPC",
    "devLuaStringout", "devstringoutStream", "devSodg535", "devSoEtherIP",
    "asynSoftGlue", "devSASoft", "devSWaitIoEvent", "devVacSen",
    "devWfSoft", "asynWfOctetCmdResponse", "asynWfOctetWriteRead",
    "asynWfOctetRead", "asynWfOctetWrite", "asynWfOctetWriteBinary",
    "asynInt8ArrayWfIn", "asynInt8ArrayWfOut", "asynInt16ArrayWfIn",
    "asynInt16ArrayWfOut", "asynInt32ArrayWfIn", "asynInt32ArrayWfOut",
    "asynFloat32ArrayWfIn", "asynFloat32ArrayWfOut",
    "asynFloat64ArrayWfIn", "asynFloat64ArrayWfOut",
    "asynInt32TimeSeries", "asynFloat64TimeSeries", "asynInt64ArrayWfIn",
    "asynInt64ArrayWfOut", "asynInt64TimeSeries", "devWaveformStats",
    "devwaveformStream", "devWfEtherIP"
};

static const dset * const devsl[] = {
    pvar_dset_devAaiSoft, pvar_dset_asynInt8ArrayAai,
    pvar_dset_asynInt16ArrayAai, pvar_dset_asynInt32ArrayAai,
    pvar_dset_asynFloat32ArrayAai, pvar_dset_asynFloat64ArrayAai,
    pvar_dset_asynInt64ArrayAai, pvar_dset_devaaiStream,
    pvar_dset_devAaoSoft, pvar_dset_asynInt8ArrayAao,
    pvar_dset_asynInt16ArrayAao, pvar_dset_asynInt32ArrayAao,
    pvar_dset_asynFloat32ArrayAao, pvar_dset_asynFloat64ArrayAao,
    pvar_dset_asynInt64ArrayAao, pvar_dset_devaaoStream,
    pvar_dset_devaCalcoutSoft, pvar_dset_devAiSoft,
    pvar_dset_devAiSoftRaw, pvar_dset_devAiSoftCallback,
    pvar_dset_devTimestampAI, pvar_dset_devAiGeneralTime,
    pvar_dset_asynAiInt32, pvar_dset_asynAiInt32Average,
    pvar_dset_asynAiFloat64, pvar_dset_asynAiFloat64Average,
    pvar_dset_asynAiInt64, pvar_dset_devAiStats, pvar_dset_devAiClusts,
    pvar_dset_devGpib, pvar_dset_devAiTodSeconds, pvar_dset_devAiStrParm,
    pvar_dset_devAiHeidND261, pvar_dset_devAiMKS, pvar_dset_devAiMPC,
    pvar_dset_devAiGP307Gpib, pvar_dset_devAiAX301,
    pvar_dset_devAiTelevac, pvar_dset_devAiTPG261, pvar_dset_devLuaAi,
    pvar_dset_devaiStream, pvar_dset_devAidg535, pvar_dset_devAiEtherIP,
    pvar_dset_devMW100_ai, pvar_dset_devAoSoft, pvar_dset_devAoSoftRaw,
    pvar_dset_devAoSoftCallback, pvar_dset_asynAoInt32,
    pvar_dset_asynAoFloat64, pvar_dset_asynAoInt64, pvar_dset_devAoStats,
    pvar_dset_devAoStrParm, pvar_dset_devAoEurotherm, pvar_dset_devAoMPC,
    pvar_dset_devAoAX301, pvar_dset_devAoTPG261, pvar_dset_devLuaAo,
    pvar_dset_devaoStream, pvar_dset_devAodg535, pvar_dset_devAoEtherIP,
    pvar_dset_devMW100_ao, pvar_dset_asynRecordDevice,
    pvar_dset_devBiSoft, pvar_dset_devBiSoftRaw,
    pvar_dset_devBiSoftCallback, pvar_dset_devBiDbState,
    pvar_dset_asynBiInt32, pvar_dset_asynBiUInt32Digital,
    pvar_dset_devBiStrParm, pvar_dset_devBiMPC, pvar_dset_devBiGP307Gpib,
    pvar_dset_devBiTelevac, pvar_dset_devBiTPG261, pvar_dset_devLuaBi,
    pvar_dset_devbiStream, pvar_dset_devBidg535, pvar_dset_devBiEtherIP,
    pvar_dset_devMW100_bi, pvar_dset_devBoSoft, pvar_dset_devBoSoftRaw,
    pvar_dset_devBoSoftCallback, pvar_dset_devBoGeneralTime,
    pvar_dset_devBoDbState, pvar_dset_asynBoInt32,
    pvar_dset_asynBoUInt32Digital, pvar_dset_devBoStrParm,
    pvar_dset_devBoMPC, pvar_dset_devBoGP307Gpib, pvar_dset_devBoAX301,
    pvar_dset_devBoTPG261, pvar_dset_devLuaBo, pvar_dset_devboStream,
    pvar_dset_devBodg535, pvar_dset_devBoEtherIP, pvar_dset_softGlueShow,
    pvar_dset_devMW100_bo, pvar_dset_devBusySoft,
    pvar_dset_devBusySoftRaw, pvar_dset_asynBusyInt32,
    pvar_dset_devCalcoutSoft, pvar_dset_devCalcoutSoftCallback,
    pvar_dset_devcalcoutStream, pvar_dset_devDigitelPump,
    pvar_dset_devEpidSoft, pvar_dset_devEpidSoftCB, pvar_dset_devEpidFast,
    pvar_dset_devEventSoft, pvar_dset_devHistogramSoft,
    pvar_dset_devI64inSoft, pvar_dset_devI64inSoftCallback,
    pvar_dset_asynInt64In, pvar_dset_devint64inStream,
    pvar_dset_devI64outSoft, pvar_dset_devI64outSoftCallback,
    pvar_dset_asynInt64Out, pvar_dset_devint64outStream,
    pvar_dset_devLiSoft, pvar_dset_devLiSoftCallback,
    pvar_dset_devLiGeneralTime, pvar_dset_asynLiInt32,
    pvar_dset_asynLiUInt32Digital, pvar_dset_asynLiInt64,
    pvar_dset_devLiStrParm, pvar_dset_devLuaLongin,
    pvar_dset_devlonginStream, pvar_dset_devLidg535,
    pvar_dset_devMW100_longin, pvar_dset_devLoSoft,
    pvar_dset_devLoSoftCallback, pvar_dset_asynLoInt32,
    pvar_dset_asynLoUInt32Digital, pvar_dset_asynLoInt64,
    pvar_dset_devLoStrParm, pvar_dset_devLoAX301, pvar_dset_devLuaLongout,
    pvar_dset_devlongoutStream, pvar_dset_devLodg535,
    pvar_dset_softGlueSigNum, pvar_dset_devLsiSoft,
    pvar_dset_devLsiEnviron, pvar_dset_asynLsiOctetCmdResponse,
    pvar_dset_asynLsiOctetWriteRead, pvar_dset_asynLsiOctetRead,
    pvar_dset_devlsiStream, pvar_dset_devLsiEtherIP, pvar_dset_devLsoSoft,
    pvar_dset_devLsoSoftCallback, pvar_dset_devLsoStdio,
    pvar_dset_asynLsoOctetWrite, pvar_dset_devlsoStream,
    pvar_dset_devLsoEtherIP, pvar_dset_devLuaSoft, pvar_dset_devMbbiSoft,
    pvar_dset_devMbbiSoftRaw, pvar_dset_devMbbiSoftCallback,
    pvar_dset_asynMbbiInt32, pvar_dset_asynMbbiUInt32Digital,
    pvar_dset_devMbbiTPG261, pvar_dset_devLuaMbbi,
    pvar_dset_devmbbiStream, pvar_dset_devMbbidg535,
    pvar_dset_devMbbiEtherIP, pvar_dset_devMW100_mbbi,
    pvar_dset_devMbbiDirectSoft, pvar_dset_devMbbiDirectSoftRaw,
    pvar_dset_devMbbiDirectSoftCallback,
    pvar_dset_asynMbbiDirectUInt32Digital, pvar_dset_devmbbiDirectStream,
    pvar_dset_devMbbiDirectEtherIP, pvar_dset_devMbboSoft,
    pvar_dset_devMbboSoftRaw, pvar_dset_devMbboSoftCallback,
    pvar_dset_asynMbboInt32, pvar_dset_asynMbboUInt32Digital,
    pvar_dset_devMbboMPC, pvar_dset_devMbboTPG261, pvar_dset_devLuaMbbo,
    pvar_dset_devmbboStream, pvar_dset_devMbbodg535,
    pvar_dset_devMbboEtherIP, pvar_dset_devMW100_mbbo,
    pvar_dset_devMbboDirectSoft, pvar_dset_devMbboDirectSoftRaw,
    pvar_dset_devMbboDirectSoftCallback,
    pvar_dset_asynMbboDirectUInt32Digital, pvar_dset_devmbboDirectStream,
    pvar_dset_devMbboDirectEtherIP, pvar_dset_devMCA_soft,
    pvar_dset_devMcaAsyn, pvar_dset_devMotorAsyn, pvar_dset_devMCB4B,
    pvar_dset_devSoloist, pvar_dset_devMCDC2805, pvar_dset_devIM483SM,
    pvar_dset_devIM483PL, pvar_dset_devMDrive, pvar_dset_devSC800,
    pvar_dset_devPM304, pvar_dset_devMicos, pvar_dset_devMVP2001,
    pvar_dset_devPMNC87xx, pvar_dset_devMM3000, pvar_dset_devMM4000,
    pvar_dset_devPM500, pvar_dset_devESP300, pvar_dset_devEMC18011,
    pvar_dset_devPC6K, pvar_dset_devPIJEDS, pvar_dset_devPIC844,
    pvar_dset_devPIC630, pvar_dset_devPIC848, pvar_dset_devPIC662,
    pvar_dset_devPIC862, pvar_dset_devPIC663, pvar_dset_devPIE710,
    pvar_dset_devPIE516, pvar_dset_devPIE517, pvar_dset_devPIE816,
    pvar_dset_devSPiiPlus, pvar_dset_devSmartMotor,
    pvar_dset_devMotorSoft, pvar_dset_devMDT695, pvar_dset_devMotorSim,
    pvar_dset_devPrintfSoft, pvar_dset_devPrintfSoftCallback,
    pvar_dset_devPrintfStdio, pvar_dset_asynPfOctetWrite,
    pvar_dset_devsCalcoutSoft, pvar_dset_devscalcoutStream,
    pvar_dset_devScalerAsyn, pvar_dset_devSiSoft,
    pvar_dset_devSiSoftCallback, pvar_dset_devTimestampSI,
    pvar_dset_devSiGeneralTime, pvar_dset_devSiEnviron,
    pvar_dset_asynSiOctetCmdResponse, pvar_dset_asynSiOctetWriteRead,
    pvar_dset_asynSiOctetRead, pvar_dset_devStringinStats,
    pvar_dset_devStringinEnvVar, pvar_dset_devStringinEpics,
    pvar_dset_devSiTodString, pvar_dset_devSiStrParm, pvar_dset_devSiMPC,
    pvar_dset_devSiGP307Gpib, pvar_dset_devSiTPG261,
    pvar_dset_devLuaStringin, pvar_dset_devstringinStream,
    pvar_dset_devSidg535, pvar_dset_devSiEtherIP,
    pvar_dset_devMW100_stringin, pvar_dset_devSoSoft,
    pvar_dset_devSoSoftCallback, pvar_dset_devSoStdio,
    pvar_dset_asynSoOctetWrite, pvar_dset_devSoStrParm,
    pvar_dset_devSoEurotherm, pvar_dset_devSoMPC,
    pvar_dset_devLuaStringout, pvar_dset_devstringoutStream,
    pvar_dset_devSodg535, pvar_dset_devSoEtherIP, pvar_dset_asynSoftGlue,
    pvar_dset_devSASoft, pvar_dset_devSWaitIoEvent, pvar_dset_devVacSen,
    pvar_dset_devWfSoft, pvar_dset_asynWfOctetCmdResponse,
    pvar_dset_asynWfOctetWriteRead, pvar_dset_asynWfOctetRead,
    pvar_dset_asynWfOctetWrite, pvar_dset_asynWfOctetWriteBinary,
    pvar_dset_asynInt8ArrayWfIn, pvar_dset_asynInt8ArrayWfOut,
    pvar_dset_asynInt16ArrayWfIn, pvar_dset_asynInt16ArrayWfOut,
    pvar_dset_asynInt32ArrayWfIn, pvar_dset_asynInt32ArrayWfOut,
    pvar_dset_asynFloat32ArrayWfIn, pvar_dset_asynFloat32ArrayWfOut,
    pvar_dset_asynFloat64ArrayWfIn, pvar_dset_asynFloat64ArrayWfOut,
    pvar_dset_asynInt32TimeSeries, pvar_dset_asynFloat64TimeSeries,
    pvar_dset_asynInt64ArrayWfIn, pvar_dset_asynInt64ArrayWfOut,
    pvar_dset_asynInt64TimeSeries, pvar_dset_devWaveformStats,
    pvar_dset_devwaveformStream, pvar_dset_devWfEtherIP
};

epicsShareExtern drvet *pvar_drvet_drvAsyn, *pvar_drvet_drvEMC18011,
    *pvar_drvet_drvESP300, *pvar_drvet_drvEtherIP, *pvar_drvet_drvIM483PL,
    *pvar_drvet_drvIM483SM, *pvar_drvet_drvIpac, *pvar_drvet_drvMCB4B,
    *pvar_drvet_drvMCDC2805, *pvar_drvet_drvMDT695, *pvar_drvet_drvMDrive,
    *pvar_drvet_drvMM3000, *pvar_drvet_drvMM4000, *pvar_drvet_drvMVP2001,
    *pvar_drvet_drvMW100, *pvar_drvet_drvMicos, *pvar_drvet_drvPC6K,
    *pvar_drvet_drvPIC630, *pvar_drvet_drvPIC662, *pvar_drvet_drvPIC663,
    *pvar_drvet_drvPIC844, *pvar_drvet_drvPIC848, *pvar_drvet_drvPIC862,
    *pvar_drvet_drvPIE516, *pvar_drvet_drvPIE517, *pvar_drvet_drvPIE710,
    *pvar_drvet_drvPIE816, *pvar_drvet_drvPIJEDS, *pvar_drvet_drvPM304,
    *pvar_drvet_drvPM500, *pvar_drvet_drvPMNC87xx, *pvar_drvet_drvSC800,
    *pvar_drvet_drvSPiiPlus, *pvar_drvet_drvSmartMotor,
    *pvar_drvet_drvSoloist, *pvar_drvet_motorA3200,
    *pvar_drvet_motorANC150, *pvar_drvet_motorEnsemble,
    *pvar_drvet_motorMM4000, *pvar_drvet_motorSim, *pvar_drvet_motorXPS,
    *pvar_drvet_stream;

static const char *driverSupportNames[] = {
    "drvAsyn", "drvEMC18011", "drvESP300", "drvEtherIP", "drvIM483PL",
    "drvIM483SM", "drvIpac", "drvMCB4B", "drvMCDC2805", "drvMDT695",
    "drvMDrive", "drvMM3000", "drvMM4000", "drvMVP2001", "drvMW100",
    "drvMicos", "drvPC6K", "drvPIC630", "drvPIC662", "drvPIC663",
    "drvPIC844", "drvPIC848", "drvPIC862", "drvPIE516", "drvPIE517",
    "drvPIE710", "drvPIE816", "drvPIJEDS", "drvPM304", "drvPM500",
    "drvPMNC87xx", "drvSC800", "drvSPiiPlus", "drvSmartMotor",
    "drvSoloist", "motorA3200", "motorANC150", "motorEnsemble",
    "motorMM4000", "motorSim", "motorXPS", "stream"};

static struct drvet *drvsl[] = {
    pvar_drvet_drvAsyn,
    pvar_drvet_drvEMC18011,
    pvar_drvet_drvESP300,
    pvar_drvet_drvEtherIP,
    pvar_drvet_drvIM483PL,
    pvar_drvet_drvIM483SM,
    pvar_drvet_drvIpac,
    pvar_drvet_drvMCB4B,
    pvar_drvet_drvMCDC2805,
    pvar_drvet_drvMDT695,
    pvar_drvet_drvMDrive,
    pvar_drvet_drvMM3000,
    pvar_drvet_drvMM4000,
    pvar_drvet_drvMVP2001,
    pvar_drvet_drvMW100,
    pvar_drvet_drvMicos,
    pvar_drvet_drvPC6K,
    pvar_drvet_drvPIC630,
    pvar_drvet_drvPIC662,
    pvar_drvet_drvPIC663,
    pvar_drvet_drvPIC844,
    pvar_drvet_drvPIC848,
    pvar_drvet_drvPIC862,
    pvar_drvet_drvPIE516,
    pvar_drvet_drvPIE517,
    pvar_drvet_drvPIE710,
    pvar_drvet_drvPIE816,
    pvar_drvet_drvPIJEDS,
    pvar_drvet_drvPM304,
    pvar_drvet_drvPM500,
    pvar_drvet_drvPMNC87xx,
    pvar_drvet_drvSC800,
    pvar_drvet_drvSPiiPlus,
    pvar_drvet_drvSmartMotor,
    pvar_drvet_drvSoloist,
    pvar_drvet_motorA3200,
    pvar_drvet_motorANC150,
    pvar_drvet_motorEnsemble,
    pvar_drvet_motorMM4000,
    pvar_drvet_motorSim,
    pvar_drvet_motorXPS,
    pvar_drvet_stream};

epicsShareExtern jlif *pvar_jlif_lnkCalcIf, *pvar_jlif_lnkConstIf,
    *pvar_jlif_lnkDebugIf, *pvar_jlif_lnkStateIf, *pvar_jlif_lnkTraceIf;

static struct jlif *jlifsl[] = {
    pvar_jlif_lnkCalcIf,
    pvar_jlif_lnkConstIf,
    pvar_jlif_lnkDebugIf,
    pvar_jlif_lnkStateIf,
    pvar_jlif_lnkTraceIf};

typedef void (*reg_func)(void);
epicsShareExtern reg_func pvar_func_ACSTech80Register,
    pvar_func_AG_CONEXRegister, pvar_func_AG_UCRegister,
    pvar_func_ANC150Register, pvar_func_AcsRegister,
    pvar_func_AerotechRegister, pvar_func_AsynDriverInterfaceRegistrar,
    pvar_func_EnsembleTrajectoryScanRegistrar, pvar_func_HXPRegister,
    pvar_func_IMSmotorRegister, pvar_func_IP_EP201Register,
    pvar_func_ImsMDrivePlusMotorRegister, pvar_func_IoRegistrar,
    pvar_func_Keithley2kDMMRegistrar,
    pvar_func_Keithley2kDMM_mf40Registrar,
    pvar_func_Keithley65xxEMRegistrar, pvar_func_MCB4BRegister,
    pvar_func_MCDC2805Register, pvar_func_MM4005_trajectoryScanRegistrar,
    pvar_func_MVP2001Register, pvar_func_MclennanRegister,
    pvar_func_MicosmotorRegister, pvar_func_NDAttrPlotRegister,
    pvar_func_NDAttrRegister, pvar_func_NDBadPixelRegister,
    pvar_func_NDCircularBuffRegister, pvar_func_NDCodecRegister,
    pvar_func_NDColorConvertRegister, pvar_func_NDFFTRegister,
    pvar_func_NDFileHDF5Register, pvar_func_NDFileJPEGRegister,
    pvar_func_NDFileMagickRegister, pvar_func_NDFileNetCDFRegister,
    pvar_func_NDFileNexusRegister, pvar_func_NDFileNullRegister,
    pvar_func_NDFileTIFFRegister, pvar_func_NDGatherRegister,
    pvar_func_NDOverlayRegister, pvar_func_NDProcessRegister,
    pvar_func_NDROIRegister, pvar_func_NDROIStatRegister,
    pvar_func_NDScatterRegister, pvar_func_NDStatsRegister,
    pvar_func_NDStdArraysRegister, pvar_func_NDTimeSeriesRegister,
    pvar_func_NDTransformRegister, pvar_func_NewFocusRegister,
    pvar_func_NewportRegister, pvar_func_OrielRegister,
    pvar_func_Oxford_CS800Registrar, pvar_func_PIC630Register,
    pvar_func_PIC662motorRegister, pvar_func_PIC663motorRegister,
    pvar_func_PIC848motorRegister, pvar_func_PIC862motorRegister,
    pvar_func_PIE516motorRegister, pvar_func_PIE517motorRegister,
    pvar_func_PIE710motorRegister, pvar_func_PIE816motorRegister,
    pvar_func_PIJEDSmotorRegister, pvar_func_PImotorRegister,
    pvar_func_ParkerRegister, pvar_func_SC800Register,
    pvar_func_SMC100Register, pvar_func_SMCcorvusRegister,
    pvar_func_SMChydraRegister, pvar_func_Scaler974Register,
    pvar_func_SmartMotormotorRegister, pvar_func_SubMLISRegister,
    pvar_func_ThorLabsRegister, pvar_func_XPSGatheringRegister,
    pvar_func_XPSInterposeRegister, pvar_func_XPSRegister,
    pvar_func_XPSRegister3, pvar_func_XPS_trajectoryScanRegistrar,
    pvar_func_aCalcMonitorMemRegister,
    pvar_func_acalcTotalAllocatedMemoryRegister, pvar_func_arrInitialize,
    pvar_func_arrayTestRegister, pvar_func_asInitHooksRegister,
    pvar_func_asSub, pvar_func_asynInterposeDelayRegister,
    pvar_func_asynInterposeEchoRegister,
    pvar_func_asynInterposeEosRegister,
    pvar_func_asynInterposeFlushRegister,
    pvar_func_asynMotorControllerRegister, pvar_func_asynRegister,
    pvar_func_caputRecorderRegister, pvar_func_concatStringRegister,
    pvar_func_configMenuRegistrar, pvar_func_dbndInitialize,
    pvar_func_dbrestoreRegister, pvar_func_decInitialize,
    pvar_func_delayDoRegistrar, pvar_func_doAfterIocInitRegistrar,
    pvar_func_drvAHxxxRegister, pvar_func_drvAsynCoherentSDGRegister,
    pvar_func_drvAsynColbyRegister, pvar_func_drvAsynDG645Register,
    pvar_func_drvAsynIPPortRegisterCommands,
    pvar_func_drvAsynIPServerPortRegisterCommands,
    pvar_func_drvAsynSerialPortRegisterCommands,
    pvar_func_drvBS_EMRegister, pvar_func_drvDac128VRegister,
    pvar_func_drvEtherIP_Register, pvar_func_drvModbusAsynRegister,
    pvar_func_drvNSLS2_EMRegister, pvar_func_drvNSLS_EMRegister,
    pvar_func_drvScalerSoftRegister, pvar_func_drvTetrAMMRegister,
    pvar_func_drvXPSAsynAuxRegister, pvar_func_editSseqRegistrar,
    pvar_func_fastSweepRegister, pvar_func_femtoRegistrar,
    pvar_func_filterDriveRegistrar, pvar_func_flexCombinedMotionRegistrar,
    pvar_func_hrCtlRegistrar, pvar_func_interpRegister,
    pvar_func_ip330Register, pvar_func_ipUnidigRegister,
    pvar_func_ipacRegistrar, pvar_func_kohzuCtlRegistrar,
    pvar_func_kohzuCtl_softRegistrar, pvar_func_libasynRegister,
    pvar_func_libdatabaseRegister, pvar_func_libepicsRegister,
    pvar_func_libosiRegister, pvar_func_luashRegister,
    pvar_func_ml_monoCtlRegistrar, pvar_func_modbusInterposeRegister,
    pvar_func_motorRegister, pvar_func_motorSimDriverRegister,
    pvar_func_motorSimRegister, pvar_func_motorUtilRegister,
    pvar_func_mw100Register, pvar_func_nf874xMotorRegister,
    pvar_func_nigpibInterposeRegister, pvar_func_orientRegistrar,
    pvar_func_parseRegister, pvar_func_pf4Registrar,
    pvar_func_portDriverRegister, pvar_func_pvHistoryRegister,
    pvar_func_rsrvRegistrar, pvar_func_saveDataRegistrar,
    pvar_func_save_restoreRegister, pvar_func_scanProgressRegistrar,
    pvar_func_streamRegistrar, pvar_func_subAveRegister,
    pvar_func_syncInitialize, pvar_func_tsInitialize,
    pvar_func_tvme200Registrar, pvar_func_utagInitialize,
    pvar_func_vipc310Registrar, pvar_func_vipc610Registrar,
    pvar_func_vipc616Registrar, pvar_func_vxi11RegisterCommands,
    pvar_func_xia_slitRegistrar, pvar_func_xiahscRegistrar,
    pvar_func_xpsSlaveRegistrar, pvar_func_xspress3Register,
    pvar_func_xy9660Registrar, pvar_func_register_func_myAttrFunct1,
    pvar_func_register_func_myTimeStampSource,
    pvar_func_register_func_rebootProc, pvar_func_register_func_scanMon,
    pvar_func_register_func_scanMonInit;

epicsShareExtern int * const pvar_int_CASDEBUG;
epicsShareExtern int * const pvar_int_aCalcAsyncThreshold;
epicsShareExtern int * const pvar_int_aCalcLoopMax;
epicsShareExtern int * const pvar_int_aCalcMonitorMem_debug;
epicsShareExtern int * const pvar_int_aCalcPerformDebug;
epicsShareExtern int * const pvar_int_aCalcPostfixDebug;
epicsShareExtern int * const pvar_int_aCalcoutRecordDebug;
epicsShareExtern int * const pvar_int_arrayTestDebug;
epicsShareExtern int * const pvar_int_asCaDebug;
epicsShareExtern int * const pvar_int_atExitDebug;
epicsShareExtern double * const pvar_double_boHIGHlimit;
epicsShareExtern int * const pvar_int_boHIGHprecision;
epicsShareExtern double * const pvar_double_calcoutODLYlimit;
epicsShareExtern int * const pvar_int_calcoutODLYprecision;
epicsShareExtern int * const pvar_int_callbackParallelThreadsDefault;
epicsShareExtern int * const pvar_int_caputRecorderDebug;
epicsShareExtern int * const pvar_int_configMenuDebug;
epicsShareExtern int * const pvar_int_dbAccessDebugPUTF;
epicsShareExtern int * const pvar_int_dbBptNotMonotonic;
epicsShareExtern int * const pvar_int_dbConvertStrict;
epicsShareExtern int * const pvar_int_dbJLinkDebug;
epicsShareExtern int * const pvar_int_dbQuietMacroWarnings;
epicsShareExtern int * const pvar_int_dbRecordsAbcSorted;
epicsShareExtern int * const pvar_int_dbRecordsOnceOnly;
epicsShareExtern int * const pvar_int_dbTemplateMaxVars;
epicsShareExtern int * const pvar_int_dbThreadRealtimeLock;
epicsShareExtern int * const pvar_int_debugSubAve;
epicsShareExtern int * const pvar_int_debugSubMLIS;
epicsShareExtern int * const pvar_int_debug_saveData;
epicsShareExtern int * const pvar_int_debug_saveDataMsg;
epicsShareExtern int * const pvar_int_devaCalcoutSoftDebug;
epicsShareExtern int * const pvar_int_devsCalcoutSoftDebug;
epicsShareExtern int * const pvar_int_drvEMC18011debug;
epicsShareExtern int * const pvar_int_drvIM483PLdebug;
epicsShareExtern int * const pvar_int_drvIM483SMdebug;
epicsShareExtern int * const pvar_int_drvMCDC2805debug;
epicsShareExtern int * const pvar_int_drvMDT695debug;
epicsShareExtern int * const pvar_int_drvMDrivedebug;
epicsShareExtern int * const pvar_int_drvPC6Kdebug;
epicsShareExtern int * const pvar_int_drvPIC630debug;
epicsShareExtern int * const pvar_int_drvPIC662debug;
epicsShareExtern int * const pvar_int_drvPIC663debug;
epicsShareExtern int * const pvar_int_drvPIC844debug;
epicsShareExtern int * const pvar_int_drvPIC848debug;
epicsShareExtern int * const pvar_int_drvPIC862debug;
epicsShareExtern int * const pvar_int_drvPIE516debug;
epicsShareExtern int * const pvar_int_drvPIE517debug;
epicsShareExtern int * const pvar_int_drvPIE710debug;
epicsShareExtern int * const pvar_int_drvPIE816debug;
epicsShareExtern int * const pvar_int_drvPIJEDSdebug;
epicsShareExtern int * const pvar_int_drvPMNC87xxdebug;
epicsShareExtern int * const pvar_int_drvSC800debug;
epicsShareExtern int * const pvar_int_drvSmartMotordebug;
epicsShareExtern int * const pvar_int_eraseNDAttributes;
epicsShareExtern int * const pvar_int_histogramSDELprecision;
epicsShareExtern int * const pvar_int_interpDebug;
epicsShareExtern int * const pvar_int_lnkDebug_debug;
epicsShareExtern int * const pvar_int_logClientDebug;
epicsShareExtern int * const pvar_int_mcaRecordDebug;
epicsShareExtern int * const pvar_int_pvHistoryDebug;
epicsShareExtern int * const pvar_int_recDigitelDebug;
epicsShareExtern int * const pvar_int_recDynLinkDebug;
epicsShareExtern int * const pvar_int_recDynLinkQsize;
epicsShareExtern int * const pvar_int_sCalcLoopMax;
epicsShareExtern int * const pvar_int_sCalcPerformDebug;
epicsShareExtern int * const pvar_int_sCalcPostfixDebug;
epicsShareExtern int * const pvar_int_sCalcStackHW;
epicsShareExtern int * const pvar_int_sCalcStackLW;
epicsShareExtern int * const pvar_int_sCalcoutRecordDebug;
epicsShareExtern int * const pvar_int_saveData_MessagePolicy;
epicsShareExtern int * const pvar_int_save_restoreDatedBackupFiles;
epicsShareExtern int * const pvar_int_save_restoreDebug;
epicsShareExtern int * const pvar_int_save_restoreIncompleteSetsOk;
epicsShareExtern int * const pvar_int_save_restoreNumSeqFiles;
epicsShareExtern int * const pvar_int_save_restoreRemountThreshold;
epicsShareExtern int * const pvar_int_save_restoreSeqPeriodInSeconds;
epicsShareExtern int * const pvar_int_scalerRecordDebug;
epicsShareExtern int * const pvar_int_scaler_wait_time;
epicsShareExtern int * const pvar_int_scanparmRecordDebug;
epicsShareExtern double * const pvar_double_seqDLYlimit;
epicsShareExtern int * const pvar_int_seqDLYprecision;
epicsShareExtern int * const pvar_int_sscanRecordConnectWaitSeconds;
epicsShareExtern int * const pvar_int_sscanRecordDebug;
epicsShareExtern int * const pvar_int_sscanRecordDontCheckLimits;
epicsShareExtern int * const pvar_int_sscanRecordLookupTime;
epicsShareExtern int * const pvar_int_sscanRecordViewPos;
epicsShareExtern int * const pvar_int_sseqRecDebug;
epicsShareExtern int * const pvar_int_streamDebug;
epicsShareExtern int * const pvar_int_streamDebugColored;
epicsShareExtern int * const pvar_int_streamError;
epicsShareExtern int * const pvar_int_streamErrorDeadTime;
epicsShareExtern int * const pvar_int_streamMsgTimeStamped;
epicsShareExtern int * const pvar_int_swaitRecordDebug;
epicsShareExtern int * const pvar_int_tableRecordDebug;
epicsShareExtern int * const pvar_int_transformRecordDebug;

static struct iocshVarDef vardefs[] = {
    {"CASDEBUG", iocshArgInt, pvar_int_CASDEBUG},
    {"aCalcAsyncThreshold", iocshArgInt, pvar_int_aCalcAsyncThreshold},
    {"aCalcLoopMax", iocshArgInt, pvar_int_aCalcLoopMax},
    {"aCalcMonitorMem_debug", iocshArgInt, pvar_int_aCalcMonitorMem_debug},
    {"aCalcPerformDebug", iocshArgInt, pvar_int_aCalcPerformDebug},
    {"aCalcPostfixDebug", iocshArgInt, pvar_int_aCalcPostfixDebug},
    {"aCalcoutRecordDebug", iocshArgInt, pvar_int_aCalcoutRecordDebug},
    {"arrayTestDebug", iocshArgInt, pvar_int_arrayTestDebug},
    {"asCaDebug", iocshArgInt, pvar_int_asCaDebug},
    {"atExitDebug", iocshArgInt, pvar_int_atExitDebug},
    {"boHIGHlimit", iocshArgDouble, pvar_double_boHIGHlimit},
    {"boHIGHprecision", iocshArgInt, pvar_int_boHIGHprecision},
    {"calcoutODLYlimit", iocshArgDouble, pvar_double_calcoutODLYlimit},
    {"calcoutODLYprecision", iocshArgInt, pvar_int_calcoutODLYprecision},
    {"callbackParallelThreadsDefault", iocshArgInt, pvar_int_callbackParallelThreadsDefault},
    {"caputRecorderDebug", iocshArgInt, pvar_int_caputRecorderDebug},
    {"configMenuDebug", iocshArgInt, pvar_int_configMenuDebug},
    {"dbAccessDebugPUTF", iocshArgInt, pvar_int_dbAccessDebugPUTF},
    {"dbBptNotMonotonic", iocshArgInt, pvar_int_dbBptNotMonotonic},
    {"dbConvertStrict", iocshArgInt, pvar_int_dbConvertStrict},
    {"dbJLinkDebug", iocshArgInt, pvar_int_dbJLinkDebug},
    {"dbQuietMacroWarnings", iocshArgInt, pvar_int_dbQuietMacroWarnings},
    {"dbRecordsAbcSorted", iocshArgInt, pvar_int_dbRecordsAbcSorted},
    {"dbRecordsOnceOnly", iocshArgInt, pvar_int_dbRecordsOnceOnly},
    {"dbTemplateMaxVars", iocshArgInt, pvar_int_dbTemplateMaxVars},
    {"dbThreadRealtimeLock", iocshArgInt, pvar_int_dbThreadRealtimeLock},
    {"debugSubAve", iocshArgInt, pvar_int_debugSubAve},
    {"debugSubMLIS", iocshArgInt, pvar_int_debugSubMLIS},
    {"debug_saveData", iocshArgInt, pvar_int_debug_saveData},
    {"debug_saveDataMsg", iocshArgInt, pvar_int_debug_saveDataMsg},
    {"devaCalcoutSoftDebug", iocshArgInt, pvar_int_devaCalcoutSoftDebug},
    {"devsCalcoutSoftDebug", iocshArgInt, pvar_int_devsCalcoutSoftDebug},
    {"drvEMC18011debug", iocshArgInt, pvar_int_drvEMC18011debug},
    {"drvIM483PLdebug", iocshArgInt, pvar_int_drvIM483PLdebug},
    {"drvIM483SMdebug", iocshArgInt, pvar_int_drvIM483SMdebug},
    {"drvMCDC2805debug", iocshArgInt, pvar_int_drvMCDC2805debug},
    {"drvMDT695debug", iocshArgInt, pvar_int_drvMDT695debug},
    {"drvMDrivedebug", iocshArgInt, pvar_int_drvMDrivedebug},
    {"drvPC6Kdebug", iocshArgInt, pvar_int_drvPC6Kdebug},
    {"drvPIC630debug", iocshArgInt, pvar_int_drvPIC630debug},
    {"drvPIC662debug", iocshArgInt, pvar_int_drvPIC662debug},
    {"drvPIC663debug", iocshArgInt, pvar_int_drvPIC663debug},
    {"drvPIC844debug", iocshArgInt, pvar_int_drvPIC844debug},
    {"drvPIC848debug", iocshArgInt, pvar_int_drvPIC848debug},
    {"drvPIC862debug", iocshArgInt, pvar_int_drvPIC862debug},
    {"drvPIE516debug", iocshArgInt, pvar_int_drvPIE516debug},
    {"drvPIE517debug", iocshArgInt, pvar_int_drvPIE517debug},
    {"drvPIE710debug", iocshArgInt, pvar_int_drvPIE710debug},
    {"drvPIE816debug", iocshArgInt, pvar_int_drvPIE816debug},
    {"drvPIJEDSdebug", iocshArgInt, pvar_int_drvPIJEDSdebug},
    {"drvPMNC87xxdebug", iocshArgInt, pvar_int_drvPMNC87xxdebug},
    {"drvSC800debug", iocshArgInt, pvar_int_drvSC800debug},
    {"drvSmartMotordebug", iocshArgInt, pvar_int_drvSmartMotordebug},
    {"eraseNDAttributes", iocshArgInt, pvar_int_eraseNDAttributes},
    {"histogramSDELprecision", iocshArgInt, pvar_int_histogramSDELprecision},
    {"interpDebug", iocshArgInt, pvar_int_interpDebug},
    {"lnkDebug_debug", iocshArgInt, pvar_int_lnkDebug_debug},
    {"logClientDebug", iocshArgInt, pvar_int_logClientDebug},
    {"mcaRecordDebug", iocshArgInt, pvar_int_mcaRecordDebug},
    {"pvHistoryDebug", iocshArgInt, pvar_int_pvHistoryDebug},
    {"recDigitelDebug", iocshArgInt, pvar_int_recDigitelDebug},
    {"recDynLinkDebug", iocshArgInt, pvar_int_recDynLinkDebug},
    {"recDynLinkQsize", iocshArgInt, pvar_int_recDynLinkQsize},
    {"sCalcLoopMax", iocshArgInt, pvar_int_sCalcLoopMax},
    {"sCalcPerformDebug", iocshArgInt, pvar_int_sCalcPerformDebug},
    {"sCalcPostfixDebug", iocshArgInt, pvar_int_sCalcPostfixDebug},
    {"sCalcStackHW", iocshArgInt, pvar_int_sCalcStackHW},
    {"sCalcStackLW", iocshArgInt, pvar_int_sCalcStackLW},
    {"sCalcoutRecordDebug", iocshArgInt, pvar_int_sCalcoutRecordDebug},
    {"saveData_MessagePolicy", iocshArgInt, pvar_int_saveData_MessagePolicy},
    {"save_restoreDatedBackupFiles", iocshArgInt, pvar_int_save_restoreDatedBackupFiles},
    {"save_restoreDebug", iocshArgInt, pvar_int_save_restoreDebug},
    {"save_restoreIncompleteSetsOk", iocshArgInt, pvar_int_save_restoreIncompleteSetsOk},
    {"save_restoreNumSeqFiles", iocshArgInt, pvar_int_save_restoreNumSeqFiles},
    {"save_restoreRemountThreshold", iocshArgInt, pvar_int_save_restoreRemountThreshold},
    {"save_restoreSeqPeriodInSeconds", iocshArgInt, pvar_int_save_restoreSeqPeriodInSeconds},
    {"scalerRecordDebug", iocshArgInt, pvar_int_scalerRecordDebug},
    {"scaler_wait_time", iocshArgInt, pvar_int_scaler_wait_time},
    {"scanparmRecordDebug", iocshArgInt, pvar_int_scanparmRecordDebug},
    {"seqDLYlimit", iocshArgDouble, pvar_double_seqDLYlimit},
    {"seqDLYprecision", iocshArgInt, pvar_int_seqDLYprecision},
    {"sscanRecordConnectWaitSeconds", iocshArgInt, pvar_int_sscanRecordConnectWaitSeconds},
    {"sscanRecordDebug", iocshArgInt, pvar_int_sscanRecordDebug},
    {"sscanRecordDontCheckLimits", iocshArgInt, pvar_int_sscanRecordDontCheckLimits},
    {"sscanRecordLookupTime", iocshArgInt, pvar_int_sscanRecordLookupTime},
    {"sscanRecordViewPos", iocshArgInt, pvar_int_sscanRecordViewPos},
    {"sseqRecDebug", iocshArgInt, pvar_int_sseqRecDebug},
    {"streamDebug", iocshArgInt, pvar_int_streamDebug},
    {"streamDebugColored", iocshArgInt, pvar_int_streamDebugColored},
    {"streamError", iocshArgInt, pvar_int_streamError},
    {"streamErrorDeadTime", iocshArgInt, pvar_int_streamErrorDeadTime},
    {"streamMsgTimeStamped", iocshArgInt, pvar_int_streamMsgTimeStamped},
    {"swaitRecordDebug", iocshArgInt, pvar_int_swaitRecordDebug},
    {"tableRecordDebug", iocshArgInt, pvar_int_tableRecordDebug},
    {"transformRecordDebug", iocshArgInt, pvar_int_transformRecordDebug},
    {NULL, iocshArgInt, NULL}
};

int sydor_bsharp_registerRecordDeviceDriver(DBBASE *pbase)
{
    static int executed = 0;
    const char *bldTop = "/opt/epics/epics_iocs/soft_iocs/sydor_bsharp";
    const char *envTop = getenv("TOP");

    if (envTop && strcmp(envTop, bldTop)) {
        printf("Warning: IOC is booting with TOP = \"%s\"\n"
               "          but was built with TOP = \"%s\"\n",
               envTop, bldTop);
    }

    if (!pbase) {
        printf("pdbbase is NULL; you must load a DBD file first.\n");
        return -1;
    }

    if (executed) {
        printf("Warning: Registration already done.\n");
    }
    executed = 1;

    registerRecordTypes(pbase, NELEMENTS(rtl), recordTypeNames, rtl);
    registerDevices(pbase, NELEMENTS(devsl), deviceSupportNames, devsl);
    registerDrivers(pbase, NELEMENTS(drvsl), driverSupportNames, drvsl);
    registerJLinks(pbase, NELEMENTS(jlifsl), jlifsl);
    runRegistrarOnce(pvar_func_ACSTech80Register);
    runRegistrarOnce(pvar_func_AG_CONEXRegister);
    runRegistrarOnce(pvar_func_AG_UCRegister);
    runRegistrarOnce(pvar_func_ANC150Register);
    runRegistrarOnce(pvar_func_AcsRegister);
    runRegistrarOnce(pvar_func_AerotechRegister);
    runRegistrarOnce(pvar_func_AsynDriverInterfaceRegistrar);
    runRegistrarOnce(pvar_func_EnsembleTrajectoryScanRegistrar);
    runRegistrarOnce(pvar_func_HXPRegister);
    runRegistrarOnce(pvar_func_IMSmotorRegister);
    runRegistrarOnce(pvar_func_IP_EP201Register);
    runRegistrarOnce(pvar_func_ImsMDrivePlusMotorRegister);
    runRegistrarOnce(pvar_func_IoRegistrar);
    runRegistrarOnce(pvar_func_Keithley2kDMMRegistrar);
    runRegistrarOnce(pvar_func_Keithley2kDMM_mf40Registrar);
    runRegistrarOnce(pvar_func_Keithley65xxEMRegistrar);
    runRegistrarOnce(pvar_func_MCB4BRegister);
    runRegistrarOnce(pvar_func_MCDC2805Register);
    runRegistrarOnce(pvar_func_MM4005_trajectoryScanRegistrar);
    runRegistrarOnce(pvar_func_MVP2001Register);
    runRegistrarOnce(pvar_func_MclennanRegister);
    runRegistrarOnce(pvar_func_MicosmotorRegister);
    runRegistrarOnce(pvar_func_NDAttrPlotRegister);
    runRegistrarOnce(pvar_func_NDAttrRegister);
    runRegistrarOnce(pvar_func_NDBadPixelRegister);
    runRegistrarOnce(pvar_func_NDCircularBuffRegister);
    runRegistrarOnce(pvar_func_NDCodecRegister);
    runRegistrarOnce(pvar_func_NDColorConvertRegister);
    runRegistrarOnce(pvar_func_NDFFTRegister);
    runRegistrarOnce(pvar_func_NDFileHDF5Register);
    runRegistrarOnce(pvar_func_NDFileJPEGRegister);
    runRegistrarOnce(pvar_func_NDFileMagickRegister);
    runRegistrarOnce(pvar_func_NDFileNetCDFRegister);
    runRegistrarOnce(pvar_func_NDFileNexusRegister);
    runRegistrarOnce(pvar_func_NDFileNullRegister);
    runRegistrarOnce(pvar_func_NDFileTIFFRegister);
    runRegistrarOnce(pvar_func_NDGatherRegister);
    runRegistrarOnce(pvar_func_NDOverlayRegister);
    runRegistrarOnce(pvar_func_NDProcessRegister);
    runRegistrarOnce(pvar_func_NDROIRegister);
    runRegistrarOnce(pvar_func_NDROIStatRegister);
    runRegistrarOnce(pvar_func_NDScatterRegister);
    runRegistrarOnce(pvar_func_NDStatsRegister);
    runRegistrarOnce(pvar_func_NDStdArraysRegister);
    runRegistrarOnce(pvar_func_NDTimeSeriesRegister);
    runRegistrarOnce(pvar_func_NDTransformRegister);
    runRegistrarOnce(pvar_func_NewFocusRegister);
    runRegistrarOnce(pvar_func_NewportRegister);
    runRegistrarOnce(pvar_func_OrielRegister);
    runRegistrarOnce(pvar_func_Oxford_CS800Registrar);
    runRegistrarOnce(pvar_func_PIC630Register);
    runRegistrarOnce(pvar_func_PIC662motorRegister);
    runRegistrarOnce(pvar_func_PIC663motorRegister);
    runRegistrarOnce(pvar_func_PIC848motorRegister);
    runRegistrarOnce(pvar_func_PIC862motorRegister);
    runRegistrarOnce(pvar_func_PIE516motorRegister);
    runRegistrarOnce(pvar_func_PIE517motorRegister);
    runRegistrarOnce(pvar_func_PIE710motorRegister);
    runRegistrarOnce(pvar_func_PIE816motorRegister);
    runRegistrarOnce(pvar_func_PIJEDSmotorRegister);
    runRegistrarOnce(pvar_func_PImotorRegister);
    runRegistrarOnce(pvar_func_ParkerRegister);
    runRegistrarOnce(pvar_func_SC800Register);
    runRegistrarOnce(pvar_func_SMC100Register);
    runRegistrarOnce(pvar_func_SMCcorvusRegister);
    runRegistrarOnce(pvar_func_SMChydraRegister);
    runRegistrarOnce(pvar_func_Scaler974Register);
    runRegistrarOnce(pvar_func_SmartMotormotorRegister);
    runRegistrarOnce(pvar_func_SubMLISRegister);
    runRegistrarOnce(pvar_func_ThorLabsRegister);
    runRegistrarOnce(pvar_func_XPSGatheringRegister);
    runRegistrarOnce(pvar_func_XPSInterposeRegister);
    runRegistrarOnce(pvar_func_XPSRegister);
    runRegistrarOnce(pvar_func_XPSRegister3);
    runRegistrarOnce(pvar_func_XPS_trajectoryScanRegistrar);
    runRegistrarOnce(pvar_func_aCalcMonitorMemRegister);
    runRegistrarOnce(pvar_func_acalcTotalAllocatedMemoryRegister);
    runRegistrarOnce(pvar_func_arrInitialize);
    runRegistrarOnce(pvar_func_arrayTestRegister);
    runRegistrarOnce(pvar_func_asInitHooksRegister);
    runRegistrarOnce(pvar_func_asSub);
    runRegistrarOnce(pvar_func_asynInterposeDelayRegister);
    runRegistrarOnce(pvar_func_asynInterposeEchoRegister);
    runRegistrarOnce(pvar_func_asynInterposeEosRegister);
    runRegistrarOnce(pvar_func_asynInterposeFlushRegister);
    runRegistrarOnce(pvar_func_asynMotorControllerRegister);
    runRegistrarOnce(pvar_func_asynRegister);
    runRegistrarOnce(pvar_func_caputRecorderRegister);
    runRegistrarOnce(pvar_func_concatStringRegister);
    runRegistrarOnce(pvar_func_configMenuRegistrar);
    runRegistrarOnce(pvar_func_dbndInitialize);
    runRegistrarOnce(pvar_func_dbrestoreRegister);
    runRegistrarOnce(pvar_func_decInitialize);
    runRegistrarOnce(pvar_func_delayDoRegistrar);
    runRegistrarOnce(pvar_func_doAfterIocInitRegistrar);
    runRegistrarOnce(pvar_func_drvAHxxxRegister);
    runRegistrarOnce(pvar_func_drvAsynCoherentSDGRegister);
    runRegistrarOnce(pvar_func_drvAsynColbyRegister);
    runRegistrarOnce(pvar_func_drvAsynDG645Register);
    runRegistrarOnce(pvar_func_drvAsynIPPortRegisterCommands);
    runRegistrarOnce(pvar_func_drvAsynIPServerPortRegisterCommands);
    runRegistrarOnce(pvar_func_drvAsynSerialPortRegisterCommands);
    runRegistrarOnce(pvar_func_drvBS_EMRegister);
    runRegistrarOnce(pvar_func_drvDac128VRegister);
    runRegistrarOnce(pvar_func_drvEtherIP_Register);
    runRegistrarOnce(pvar_func_drvModbusAsynRegister);
    runRegistrarOnce(pvar_func_drvNSLS2_EMRegister);
    runRegistrarOnce(pvar_func_drvNSLS_EMRegister);
    runRegistrarOnce(pvar_func_drvScalerSoftRegister);
    runRegistrarOnce(pvar_func_drvTetrAMMRegister);
    runRegistrarOnce(pvar_func_drvXPSAsynAuxRegister);
    runRegistrarOnce(pvar_func_editSseqRegistrar);
    runRegistrarOnce(pvar_func_fastSweepRegister);
    runRegistrarOnce(pvar_func_femtoRegistrar);
    runRegistrarOnce(pvar_func_filterDriveRegistrar);
    runRegistrarOnce(pvar_func_flexCombinedMotionRegistrar);
    runRegistrarOnce(pvar_func_hrCtlRegistrar);
    runRegistrarOnce(pvar_func_interpRegister);
    runRegistrarOnce(pvar_func_ip330Register);
    runRegistrarOnce(pvar_func_ipUnidigRegister);
    runRegistrarOnce(pvar_func_ipacRegistrar);
    runRegistrarOnce(pvar_func_kohzuCtlRegistrar);
    runRegistrarOnce(pvar_func_kohzuCtl_softRegistrar);
    runRegistrarOnce(pvar_func_libasynRegister);
    runRegistrarOnce(pvar_func_libdatabaseRegister);
    runRegistrarOnce(pvar_func_libepicsRegister);
    runRegistrarOnce(pvar_func_libosiRegister);
    runRegistrarOnce(pvar_func_luashRegister);
    runRegistrarOnce(pvar_func_ml_monoCtlRegistrar);
    runRegistrarOnce(pvar_func_modbusInterposeRegister);
    runRegistrarOnce(pvar_func_motorRegister);
    runRegistrarOnce(pvar_func_motorSimDriverRegister);
    runRegistrarOnce(pvar_func_motorSimRegister);
    runRegistrarOnce(pvar_func_motorUtilRegister);
    runRegistrarOnce(pvar_func_mw100Register);
    runRegistrarOnce(pvar_func_nf874xMotorRegister);
    runRegistrarOnce(pvar_func_nigpibInterposeRegister);
    runRegistrarOnce(pvar_func_orientRegistrar);
    runRegistrarOnce(pvar_func_parseRegister);
    runRegistrarOnce(pvar_func_pf4Registrar);
    runRegistrarOnce(pvar_func_portDriverRegister);
    runRegistrarOnce(pvar_func_pvHistoryRegister);
    runRegistrarOnce(pvar_func_rsrvRegistrar);
    runRegistrarOnce(pvar_func_saveDataRegistrar);
    runRegistrarOnce(pvar_func_save_restoreRegister);
    runRegistrarOnce(pvar_func_scanProgressRegistrar);
    runRegistrarOnce(pvar_func_streamRegistrar);
    runRegistrarOnce(pvar_func_subAveRegister);
    runRegistrarOnce(pvar_func_syncInitialize);
    runRegistrarOnce(pvar_func_tsInitialize);
    runRegistrarOnce(pvar_func_tvme200Registrar);
    runRegistrarOnce(pvar_func_utagInitialize);
    runRegistrarOnce(pvar_func_vipc310Registrar);
    runRegistrarOnce(pvar_func_vipc610Registrar);
    runRegistrarOnce(pvar_func_vipc616Registrar);
    runRegistrarOnce(pvar_func_vxi11RegisterCommands);
    runRegistrarOnce(pvar_func_xia_slitRegistrar);
    runRegistrarOnce(pvar_func_xiahscRegistrar);
    runRegistrarOnce(pvar_func_xpsSlaveRegistrar);
    runRegistrarOnce(pvar_func_xspress3Register);
    runRegistrarOnce(pvar_func_xy9660Registrar);
    runRegistrarOnce(pvar_func_register_func_myAttrFunct1);
    runRegistrarOnce(pvar_func_register_func_myTimeStampSource);
    runRegistrarOnce(pvar_func_register_func_rebootProc);
    runRegistrarOnce(pvar_func_register_func_scanMon);
    runRegistrarOnce(pvar_func_register_func_scanMonInit);
    iocshRegisterVariable(vardefs);
    return 0;
}

/* sydor_bsharp_registerRecordDeviceDriver */
static const iocshArg rrddArg0 = {"pdbbase", iocshArgPdbbase};
static const iocshArg *rrddArgs[] = {&rrddArg0};
static const iocshFuncDef rrddFuncDef = {
    "sydor_bsharp_registerRecordDeviceDriver",
    1,
    rrddArgs,
    "Register the various records, devices, for this DBD.\n\n"
    "These are registered into the database given as first argument,\n"
    "which should always be 'pdbbase'.\n\n"
    "Example: sydor_bsharp_registerRecordDeviceDriver pdbbase\n",
};
static void rrddCallFunc(const iocshArgBuf *)
{
    iocshSetError(sydor_bsharp_registerRecordDeviceDriver(*iocshPpdbbase));
}

} // extern "C"

/*
 * Register commands on application startup
 */
static int Registration() {
    iocshRegisterCommon();
    iocshRegister(&rrddFuncDef, rrddCallFunc);
    return 0;
}

static int done EPICS_UNUSED = Registration();
