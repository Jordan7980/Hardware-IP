// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2024.1 (64-bit)
// Tool Version Limit: 2024.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
/***************************** Include Files *********************************/
#include "xfir_filter.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XFir_filter_CfgInitialize(XFir_filter *InstancePtr, XFir_filter_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Ctrl_BaseAddress = ConfigPtr->Ctrl_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XFir_filter_Start(XFir_filter *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFir_filter_ReadReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_AP_CTRL) & 0x80;
    XFir_filter_WriteReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XFir_filter_IsDone(XFir_filter *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFir_filter_ReadReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XFir_filter_IsIdle(XFir_filter *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFir_filter_ReadReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XFir_filter_IsReady(XFir_filter *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFir_filter_ReadReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XFir_filter_EnableAutoRestart(XFir_filter *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFir_filter_WriteReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_AP_CTRL, 0x80);
}

void XFir_filter_DisableAutoRestart(XFir_filter *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFir_filter_WriteReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_AP_CTRL, 0);
}

void XFir_filter_Set_coeffs_0(XFir_filter *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFir_filter_WriteReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_COEFFS_0_DATA, Data);
}

u32 XFir_filter_Get_coeffs_0(XFir_filter *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFir_filter_ReadReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_COEFFS_0_DATA);
    return Data;
}

void XFir_filter_Set_coeffs_1(XFir_filter *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFir_filter_WriteReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_COEFFS_1_DATA, Data);
}

u32 XFir_filter_Get_coeffs_1(XFir_filter *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFir_filter_ReadReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_COEFFS_1_DATA);
    return Data;
}

void XFir_filter_Set_coeffs_2(XFir_filter *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFir_filter_WriteReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_COEFFS_2_DATA, Data);
}

u32 XFir_filter_Get_coeffs_2(XFir_filter *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFir_filter_ReadReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_COEFFS_2_DATA);
    return Data;
}

void XFir_filter_Set_coeffs_3(XFir_filter *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFir_filter_WriteReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_COEFFS_3_DATA, Data);
}

u32 XFir_filter_Get_coeffs_3(XFir_filter *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFir_filter_ReadReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_COEFFS_3_DATA);
    return Data;
}

void XFir_filter_Set_coeffs_4(XFir_filter *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFir_filter_WriteReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_COEFFS_4_DATA, Data);
}

u32 XFir_filter_Get_coeffs_4(XFir_filter *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFir_filter_ReadReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_COEFFS_4_DATA);
    return Data;
}

void XFir_filter_Set_coeffs_5(XFir_filter *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFir_filter_WriteReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_COEFFS_5_DATA, Data);
}

u32 XFir_filter_Get_coeffs_5(XFir_filter *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFir_filter_ReadReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_COEFFS_5_DATA);
    return Data;
}

void XFir_filter_Set_coeffs_6(XFir_filter *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFir_filter_WriteReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_COEFFS_6_DATA, Data);
}

u32 XFir_filter_Get_coeffs_6(XFir_filter *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFir_filter_ReadReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_COEFFS_6_DATA);
    return Data;
}

void XFir_filter_Set_coeffs_7(XFir_filter *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFir_filter_WriteReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_COEFFS_7_DATA, Data);
}

u32 XFir_filter_Get_coeffs_7(XFir_filter *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFir_filter_ReadReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_COEFFS_7_DATA);
    return Data;
}

void XFir_filter_Set_coeffs_8(XFir_filter *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFir_filter_WriteReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_COEFFS_8_DATA, Data);
}

u32 XFir_filter_Get_coeffs_8(XFir_filter *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFir_filter_ReadReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_COEFFS_8_DATA);
    return Data;
}

void XFir_filter_Set_coeffs_9(XFir_filter *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFir_filter_WriteReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_COEFFS_9_DATA, Data);
}

u32 XFir_filter_Get_coeffs_9(XFir_filter *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFir_filter_ReadReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_COEFFS_9_DATA);
    return Data;
}

void XFir_filter_Set_coeffs_10(XFir_filter *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFir_filter_WriteReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_COEFFS_10_DATA, Data);
}

u32 XFir_filter_Get_coeffs_10(XFir_filter *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFir_filter_ReadReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_COEFFS_10_DATA);
    return Data;
}

void XFir_filter_Set_coeffs_11(XFir_filter *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFir_filter_WriteReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_COEFFS_11_DATA, Data);
}

u32 XFir_filter_Get_coeffs_11(XFir_filter *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFir_filter_ReadReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_COEFFS_11_DATA);
    return Data;
}

void XFir_filter_Set_coeffs_12(XFir_filter *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFir_filter_WriteReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_COEFFS_12_DATA, Data);
}

u32 XFir_filter_Get_coeffs_12(XFir_filter *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFir_filter_ReadReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_COEFFS_12_DATA);
    return Data;
}

void XFir_filter_Set_coeffs_13(XFir_filter *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFir_filter_WriteReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_COEFFS_13_DATA, Data);
}

u32 XFir_filter_Get_coeffs_13(XFir_filter *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFir_filter_ReadReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_COEFFS_13_DATA);
    return Data;
}

void XFir_filter_Set_coeffs_14(XFir_filter *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFir_filter_WriteReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_COEFFS_14_DATA, Data);
}

u32 XFir_filter_Get_coeffs_14(XFir_filter *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFir_filter_ReadReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_COEFFS_14_DATA);
    return Data;
}

void XFir_filter_Set_coeffs_15(XFir_filter *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFir_filter_WriteReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_COEFFS_15_DATA, Data);
}

u32 XFir_filter_Get_coeffs_15(XFir_filter *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFir_filter_ReadReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_COEFFS_15_DATA);
    return Data;
}

void XFir_filter_Set_coeffs_16(XFir_filter *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFir_filter_WriteReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_COEFFS_16_DATA, Data);
}

u32 XFir_filter_Get_coeffs_16(XFir_filter *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFir_filter_ReadReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_COEFFS_16_DATA);
    return Data;
}

void XFir_filter_Set_coeffs_17(XFir_filter *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFir_filter_WriteReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_COEFFS_17_DATA, Data);
}

u32 XFir_filter_Get_coeffs_17(XFir_filter *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFir_filter_ReadReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_COEFFS_17_DATA);
    return Data;
}

void XFir_filter_Set_coeffs_18(XFir_filter *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFir_filter_WriteReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_COEFFS_18_DATA, Data);
}

u32 XFir_filter_Get_coeffs_18(XFir_filter *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFir_filter_ReadReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_COEFFS_18_DATA);
    return Data;
}

void XFir_filter_Set_coeffs_19(XFir_filter *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFir_filter_WriteReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_COEFFS_19_DATA, Data);
}

u32 XFir_filter_Get_coeffs_19(XFir_filter *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFir_filter_ReadReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_COEFFS_19_DATA);
    return Data;
}

void XFir_filter_Set_coeffs_20(XFir_filter *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFir_filter_WriteReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_COEFFS_20_DATA, Data);
}

u32 XFir_filter_Get_coeffs_20(XFir_filter *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFir_filter_ReadReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_COEFFS_20_DATA);
    return Data;
}

void XFir_filter_Set_coeffs_21(XFir_filter *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFir_filter_WriteReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_COEFFS_21_DATA, Data);
}

u32 XFir_filter_Get_coeffs_21(XFir_filter *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFir_filter_ReadReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_COEFFS_21_DATA);
    return Data;
}

void XFir_filter_Set_coeffs_22(XFir_filter *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFir_filter_WriteReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_COEFFS_22_DATA, Data);
}

u32 XFir_filter_Get_coeffs_22(XFir_filter *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFir_filter_ReadReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_COEFFS_22_DATA);
    return Data;
}

void XFir_filter_Set_coeffs_23(XFir_filter *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFir_filter_WriteReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_COEFFS_23_DATA, Data);
}

u32 XFir_filter_Get_coeffs_23(XFir_filter *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFir_filter_ReadReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_COEFFS_23_DATA);
    return Data;
}

void XFir_filter_Set_coeffs_24(XFir_filter *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFir_filter_WriteReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_COEFFS_24_DATA, Data);
}

u32 XFir_filter_Get_coeffs_24(XFir_filter *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFir_filter_ReadReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_COEFFS_24_DATA);
    return Data;
}

void XFir_filter_Set_coeffs_25(XFir_filter *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFir_filter_WriteReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_COEFFS_25_DATA, Data);
}

u32 XFir_filter_Get_coeffs_25(XFir_filter *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFir_filter_ReadReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_COEFFS_25_DATA);
    return Data;
}

void XFir_filter_Set_coeffs_26(XFir_filter *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFir_filter_WriteReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_COEFFS_26_DATA, Data);
}

u32 XFir_filter_Get_coeffs_26(XFir_filter *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFir_filter_ReadReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_COEFFS_26_DATA);
    return Data;
}

void XFir_filter_Set_coeffs_27(XFir_filter *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFir_filter_WriteReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_COEFFS_27_DATA, Data);
}

u32 XFir_filter_Get_coeffs_27(XFir_filter *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFir_filter_ReadReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_COEFFS_27_DATA);
    return Data;
}

void XFir_filter_Set_coeffs_28(XFir_filter *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFir_filter_WriteReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_COEFFS_28_DATA, Data);
}

u32 XFir_filter_Get_coeffs_28(XFir_filter *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFir_filter_ReadReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_COEFFS_28_DATA);
    return Data;
}

void XFir_filter_Set_coeffs_29(XFir_filter *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFir_filter_WriteReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_COEFFS_29_DATA, Data);
}

u32 XFir_filter_Get_coeffs_29(XFir_filter *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFir_filter_ReadReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_COEFFS_29_DATA);
    return Data;
}

void XFir_filter_Set_coeffs_30(XFir_filter *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFir_filter_WriteReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_COEFFS_30_DATA, Data);
}

u32 XFir_filter_Get_coeffs_30(XFir_filter *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFir_filter_ReadReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_COEFFS_30_DATA);
    return Data;
}

void XFir_filter_Set_coeffs_31(XFir_filter *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFir_filter_WriteReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_COEFFS_31_DATA, Data);
}

u32 XFir_filter_Get_coeffs_31(XFir_filter *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFir_filter_ReadReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_COEFFS_31_DATA);
    return Data;
}

void XFir_filter_Set_num_taps(XFir_filter *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFir_filter_WriteReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_NUM_TAPS_DATA, Data);
}

u32 XFir_filter_Get_num_taps(XFir_filter *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFir_filter_ReadReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_NUM_TAPS_DATA);
    return Data;
}

void XFir_filter_Set_num_samples(XFir_filter *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFir_filter_WriteReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_NUM_SAMPLES_DATA, Data);
}

u32 XFir_filter_Get_num_samples(XFir_filter *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFir_filter_ReadReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_NUM_SAMPLES_DATA);
    return Data;
}

void XFir_filter_InterruptGlobalEnable(XFir_filter *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFir_filter_WriteReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_GIE, 1);
}

void XFir_filter_InterruptGlobalDisable(XFir_filter *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFir_filter_WriteReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_GIE, 0);
}

void XFir_filter_InterruptEnable(XFir_filter *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XFir_filter_ReadReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_IER);
    XFir_filter_WriteReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_IER, Register | Mask);
}

void XFir_filter_InterruptDisable(XFir_filter *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XFir_filter_ReadReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_IER);
    XFir_filter_WriteReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_IER, Register & (~Mask));
}

void XFir_filter_InterruptClear(XFir_filter *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFir_filter_WriteReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_ISR, Mask);
}

u32 XFir_filter_InterruptGetEnabled(XFir_filter *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XFir_filter_ReadReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_IER);
}

u32 XFir_filter_InterruptGetStatus(XFir_filter *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XFir_filter_ReadReg(InstancePtr->Ctrl_BaseAddress, XFIR_FILTER_CTRL_ADDR_ISR);
}

