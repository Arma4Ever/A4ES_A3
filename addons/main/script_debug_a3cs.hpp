#ifdef A3CS_DEBUG_ENABLED
    #define A3CS_LOG(module,level,message) diag_log text A3CS_LOGFORMAT(module,level,message);
#else
    #define A3CS_LOG(module,level,message)
#endif

#define A3CS_LOGFORMAT(module,level,message) FORMAT_3(QUOTE(*A3CS_%1* [%2] %3),level,QUOTE(ADDON),message)

#define A3CS_LOGINFO(message) A3CS_LOG(COMPONENT,"INFO",message)
#define A3CS_LOGINFO_1(message,arg1) A3CS_LOGINFO(FORMAT_1(message,arg1))
#define A3CS_LOGINFO_2(message,arg1,arg2) A3CS_LOGINFO(FORMAT_2(message,arg1,arg2))
#define A3CS_LOGINFO_3(message,arg1,arg2,arg3) A3CS_LOGINFO(FORMAT_3(message,arg1,arg2,arg3))
#define A3CS_LOGINFO_4(message,arg1,arg2,arg3,arg4) A3CS_LOGINFO(FORMAT_4(message,arg1,arg2,arg3,arg4))
#define A3CS_LOGINFO_5(message,arg1,arg2,arg3,arg4,arg5) A3CS_LOGINFO(FORMAT_5(message,arg1,arg2,arg3,arg4,arg5))
#define A3CS_LOGINFO_6(message,arg1,arg2,arg3,arg4,arg5,arg6) A3CS_LOGINFO(FORMAT_6(message,arg1,arg2,arg3,arg4,arg5,arg6))
#define A3CS_LOGINFO_7(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7) A3CS_LOGINFO(FORMAT_7(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7))
#define A3CS_LOGINFO_8(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8) A3CS_LOGINFO(FORMAT_8(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8))

#define A3CS_LOGWARN(message) A3CS_LOG(COMPONENT,"WARN",message)
#define A3CS_LOGWARN_1(message,arg1) A3CS_LOGWARN(FORMAT_1(message,arg1))
#define A3CS_LOGWARN_2(message,arg1,arg2) A3CS_LOGWARN(FORMAT_2(message,arg1,arg2))
#define A3CS_LOGWARN_3(message,arg1,arg2,arg3) A3CS_LOGWARN(FORMAT_3(message,arg1,arg2,arg3))
#define A3CS_LOGWARN_4(message,arg1,arg2,arg3,arg4) A3CS_LOGWARN(FORMAT_4(message,arg1,arg2,arg3,arg4))
#define A3CS_LOGWARN_5(message,arg1,arg2,arg3,arg4,arg5) A3CS_LOGWARN(FORMAT_5(message,arg1,arg2,arg3,arg4,arg5))
#define A3CS_LOGWARN_6(message,arg1,arg2,arg3,arg4,arg5,arg6) A3CS_LOGWARN(FORMAT_6(message,arg1,arg2,arg3,arg4,arg5,arg6))
#define A3CS_LOGWARN_7(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7) A3CS_LOGWARN(FORMAT_7(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7))
#define A3CS_LOGWARN_8(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8) A3CS_LOGWARN(FORMAT_8(message,arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8))
