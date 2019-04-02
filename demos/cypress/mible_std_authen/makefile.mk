#
# Copyright 2018, Cypress Semiconductor Corporation or a subsidiary of Cypress Semiconductor 
#  Corporation. All rights reserved. This software, including source code, documentation and  related 
# materials ("Software"), is owned by Cypress Semiconductor  Corporation or one of its 
#  subsidiaries ("Cypress") and is protected by and subject to worldwide patent protection  
# (United States and foreign), United States copyright laws and international treaty provisions. 
# Therefore, you may use this Software only as provided in the license agreement accompanying the 
# software package from which you obtained this Software ("EULA"). If no EULA applies, Cypress 
# hereby grants you a personal, nonexclusive, non-transferable license to  copy, modify, and 
# compile the Software source code solely for use in connection with Cypress's  integrated circuit 
# products. Any reproduction, modification, translation, compilation,  or representation of this 
# Software except as specified above is prohibited without the express written permission of 
# Cypress. Disclaimer: THIS SOFTWARE IS PROVIDED AS-IS, WITH NO  WARRANTY OF ANY KIND, EXPRESS 
# OR IMPLIED, INCLUDING,  BUT NOT LIMITED TO, NONINFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY 
# AND FITNESS FOR A PARTICULAR PURPOSE. Cypress reserves the right to make changes to 
# the Software without notice. Cypress does not assume any liability arising out of the application 
# or use of the Software or any product or circuit  described in the Software. Cypress does 
# not authorize its products for use in any products where a malfunction or failure of the 
# Cypress product may reasonably be expected to result  in significant property damage, injury 
# or death ("High Risk Product"). By including Cypress's product in a High Risk Product, the 
#  manufacturer of such system or application assumes  all risk of such use and in doing so agrees 
# to indemnify Cypress against all liability.
#
C_FLAGS += -DWICED_BT_TRACE_ENABLE
C_FLAGS += -DENABLE_HCI_TRACE

#all the bring-up logs from Cypress are enabled to use following flag
#if this flag is enbaled, MI_LOG_ENABLED must be enbaled concurrently
#C_FLAGS += -DCY_BRINGUP_LOG_ENABLE

#Enable Xiaomi log
#C_FLAGS += -DMI_LOG_ENABLED

#if useing Cypress encription, define this flag to 1
USE_CY_AES128_CRYPT := 1

#STRONG_BONDING, 0x3a2/930
#WEAK_BONDING,   0x9c/156
C_FLAGS += -DPRODUCT_ID=930                   

########################################################################
# Add Application sources here.
########################################################################
$(NAME)_COMPONENTS := mijia_std_authen_wiced_20706_v1.0.4.a

APP_SRC = ../portable/wiced_api.c

ifneq ($(USE_CY_AES128_CRYPT),1)
APP_SRC += ../portable/aes.c
else
C_FLAGS += -DUSE_CY_AES128_ENCRYPT
endif

APP_SRC +=../../../libs/common/ccm.c
APP_SRC +=../../../libs/common/mible_beacon.c
APP_SRC +=../../../libs/common/queue.c
APP_SRC +=../../../libs/common/sha256_hkdf.c
APP_SRC += mible_std_authen.c
APP_SRC += wiced_bt_cfg.c

C_FLAGS +=  -std=c99

# -std=c99, -std=gnu99, -std=c11 or -std=gnu11

INCS += ../../apps/demo/mijia_ble/libs/common
INCS += ../../apps/demo/mijia_ble/libs/mible_app_authen
INCS += ../../apps/demo/mijia_ble/demos/cypress/portable


########################################################################
################ DO NOT MODIFY FILE BELOW THIS LINE ####################
########################################################################
