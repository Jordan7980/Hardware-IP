// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2024.1 (64-bit)
// Tool Version Limit: 2024.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef XFIR_FILTER_H
#define XFIR_FILTER_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xfir_filter_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
#ifdef SDT
    char *Name;
#else
    u16 DeviceId;
#endif
    u64 Ctrl_BaseAddress;
} XFir_filter_Config;
#endif

typedef struct {
    u64 Ctrl_BaseAddress;
    u32 IsReady;
} XFir_filter;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XFir_filter_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XFir_filter_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XFir_filter_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XFir_filter_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
#ifdef SDT
int XFir_filter_Initialize(XFir_filter *InstancePtr, UINTPTR BaseAddress);
XFir_filter_Config* XFir_filter_LookupConfig(UINTPTR BaseAddress);
#else
int XFir_filter_Initialize(XFir_filter *InstancePtr, u16 DeviceId);
XFir_filter_Config* XFir_filter_LookupConfig(u16 DeviceId);
#endif
int XFir_filter_CfgInitialize(XFir_filter *InstancePtr, XFir_filter_Config *ConfigPtr);
#else
int XFir_filter_Initialize(XFir_filter *InstancePtr, const char* InstanceName);
int XFir_filter_Release(XFir_filter *InstancePtr);
#endif

void XFir_filter_Start(XFir_filter *InstancePtr);
u32 XFir_filter_IsDone(XFir_filter *InstancePtr);
u32 XFir_filter_IsIdle(XFir_filter *InstancePtr);
u32 XFir_filter_IsReady(XFir_filter *InstancePtr);
void XFir_filter_EnableAutoRestart(XFir_filter *InstancePtr);
void XFir_filter_DisableAutoRestart(XFir_filter *InstancePtr);

void XFir_filter_Set_coeffs_0(XFir_filter *InstancePtr, u32 Data);
u32 XFir_filter_Get_coeffs_0(XFir_filter *InstancePtr);
void XFir_filter_Set_coeffs_1(XFir_filter *InstancePtr, u32 Data);
u32 XFir_filter_Get_coeffs_1(XFir_filter *InstancePtr);
void XFir_filter_Set_coeffs_2(XFir_filter *InstancePtr, u32 Data);
u32 XFir_filter_Get_coeffs_2(XFir_filter *InstancePtr);
void XFir_filter_Set_coeffs_3(XFir_filter *InstancePtr, u32 Data);
u32 XFir_filter_Get_coeffs_3(XFir_filter *InstancePtr);
void XFir_filter_Set_coeffs_4(XFir_filter *InstancePtr, u32 Data);
u32 XFir_filter_Get_coeffs_4(XFir_filter *InstancePtr);
void XFir_filter_Set_coeffs_5(XFir_filter *InstancePtr, u32 Data);
u32 XFir_filter_Get_coeffs_5(XFir_filter *InstancePtr);
void XFir_filter_Set_coeffs_6(XFir_filter *InstancePtr, u32 Data);
u32 XFir_filter_Get_coeffs_6(XFir_filter *InstancePtr);
void XFir_filter_Set_coeffs_7(XFir_filter *InstancePtr, u32 Data);
u32 XFir_filter_Get_coeffs_7(XFir_filter *InstancePtr);
void XFir_filter_Set_coeffs_8(XFir_filter *InstancePtr, u32 Data);
u32 XFir_filter_Get_coeffs_8(XFir_filter *InstancePtr);
void XFir_filter_Set_coeffs_9(XFir_filter *InstancePtr, u32 Data);
u32 XFir_filter_Get_coeffs_9(XFir_filter *InstancePtr);
void XFir_filter_Set_coeffs_10(XFir_filter *InstancePtr, u32 Data);
u32 XFir_filter_Get_coeffs_10(XFir_filter *InstancePtr);
void XFir_filter_Set_coeffs_11(XFir_filter *InstancePtr, u32 Data);
u32 XFir_filter_Get_coeffs_11(XFir_filter *InstancePtr);
void XFir_filter_Set_coeffs_12(XFir_filter *InstancePtr, u32 Data);
u32 XFir_filter_Get_coeffs_12(XFir_filter *InstancePtr);
void XFir_filter_Set_coeffs_13(XFir_filter *InstancePtr, u32 Data);
u32 XFir_filter_Get_coeffs_13(XFir_filter *InstancePtr);
void XFir_filter_Set_coeffs_14(XFir_filter *InstancePtr, u32 Data);
u32 XFir_filter_Get_coeffs_14(XFir_filter *InstancePtr);
void XFir_filter_Set_coeffs_15(XFir_filter *InstancePtr, u32 Data);
u32 XFir_filter_Get_coeffs_15(XFir_filter *InstancePtr);
void XFir_filter_Set_coeffs_16(XFir_filter *InstancePtr, u32 Data);
u32 XFir_filter_Get_coeffs_16(XFir_filter *InstancePtr);
void XFir_filter_Set_coeffs_17(XFir_filter *InstancePtr, u32 Data);
u32 XFir_filter_Get_coeffs_17(XFir_filter *InstancePtr);
void XFir_filter_Set_coeffs_18(XFir_filter *InstancePtr, u32 Data);
u32 XFir_filter_Get_coeffs_18(XFir_filter *InstancePtr);
void XFir_filter_Set_coeffs_19(XFir_filter *InstancePtr, u32 Data);
u32 XFir_filter_Get_coeffs_19(XFir_filter *InstancePtr);
void XFir_filter_Set_coeffs_20(XFir_filter *InstancePtr, u32 Data);
u32 XFir_filter_Get_coeffs_20(XFir_filter *InstancePtr);
void XFir_filter_Set_coeffs_21(XFir_filter *InstancePtr, u32 Data);
u32 XFir_filter_Get_coeffs_21(XFir_filter *InstancePtr);
void XFir_filter_Set_coeffs_22(XFir_filter *InstancePtr, u32 Data);
u32 XFir_filter_Get_coeffs_22(XFir_filter *InstancePtr);
void XFir_filter_Set_coeffs_23(XFir_filter *InstancePtr, u32 Data);
u32 XFir_filter_Get_coeffs_23(XFir_filter *InstancePtr);
void XFir_filter_Set_coeffs_24(XFir_filter *InstancePtr, u32 Data);
u32 XFir_filter_Get_coeffs_24(XFir_filter *InstancePtr);
void XFir_filter_Set_coeffs_25(XFir_filter *InstancePtr, u32 Data);
u32 XFir_filter_Get_coeffs_25(XFir_filter *InstancePtr);
void XFir_filter_Set_coeffs_26(XFir_filter *InstancePtr, u32 Data);
u32 XFir_filter_Get_coeffs_26(XFir_filter *InstancePtr);
void XFir_filter_Set_coeffs_27(XFir_filter *InstancePtr, u32 Data);
u32 XFir_filter_Get_coeffs_27(XFir_filter *InstancePtr);
void XFir_filter_Set_coeffs_28(XFir_filter *InstancePtr, u32 Data);
u32 XFir_filter_Get_coeffs_28(XFir_filter *InstancePtr);
void XFir_filter_Set_coeffs_29(XFir_filter *InstancePtr, u32 Data);
u32 XFir_filter_Get_coeffs_29(XFir_filter *InstancePtr);
void XFir_filter_Set_coeffs_30(XFir_filter *InstancePtr, u32 Data);
u32 XFir_filter_Get_coeffs_30(XFir_filter *InstancePtr);
void XFir_filter_Set_coeffs_31(XFir_filter *InstancePtr, u32 Data);
u32 XFir_filter_Get_coeffs_31(XFir_filter *InstancePtr);
void XFir_filter_Set_num_taps(XFir_filter *InstancePtr, u32 Data);
u32 XFir_filter_Get_num_taps(XFir_filter *InstancePtr);
void XFir_filter_Set_num_samples(XFir_filter *InstancePtr, u32 Data);
u32 XFir_filter_Get_num_samples(XFir_filter *InstancePtr);

void XFir_filter_InterruptGlobalEnable(XFir_filter *InstancePtr);
void XFir_filter_InterruptGlobalDisable(XFir_filter *InstancePtr);
void XFir_filter_InterruptEnable(XFir_filter *InstancePtr, u32 Mask);
void XFir_filter_InterruptDisable(XFir_filter *InstancePtr, u32 Mask);
void XFir_filter_InterruptClear(XFir_filter *InstancePtr, u32 Mask);
u32 XFir_filter_InterruptGetEnabled(XFir_filter *InstancePtr);
u32 XFir_filter_InterruptGetStatus(XFir_filter *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
