/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// The Cangjie API is in Beta. For details on its capabilities and limitations, please refer to the README file.

package ohos.notification_request

import ohos.ffi.CArrString
import ohos.notification_flags.CNotificationFlags
import ohos.notification_content.CNotificationContent

@C
struct CDistributedOptions {
    var isDistributed: Bool
    var supportDisplayDevices: CArrString
    var supportOperateDevices: CArrString

    init() {
        isDistributed = false
        supportDisplayDevices = CArrString(CPointer<CString>(), 0)
        supportOperateDevices = CArrString(CPointer<CString>(), 0)
    }

    func free() {
        supportDisplayDevices.free()
        supportOperateDevices.free()
    }
}

@C
protected struct CNotificationRequestV2 {
    CNotificationRequestV2(
        var content: CNotificationContent,
        let id: Int32,
        let notificationSlotType: Int32,
        let isOngoing: Bool,
        let isUnremovable: Bool,
        let deliveryTime: Int64,
        let tapDismissed: Bool,
        let autoDeletedTime: Int64,
        let color: UInt32,
        let colorEnabled: Bool,
        let isAlertOnce: Bool,
        let isStopwatch: Bool,
        let isCountDown: Bool,
        let isFloatingIcon: Bool,
        var label: CString,
        let badgeIconStyle: Int32,
        let showDeliveryTime: Bool,
        var smallIcon: Int64,
        var largeIcon: Int64,
        var creatorBundleName: CString,
        let creatorUid: Int32,
        let creatorPid: Int32,
        let creatorUserId: Int32,
        var hashCode: CString,
        var groupName: CString,
        var distributedOption: CPointer<CDistributedOptions>,
        var notificationFlags: CNotificationFlags,
        let badgeNumber: UInt32,
        var appMessageId: CString
    ) {}

    protected func free() {
        content.free()
        unsafe {
            LibC.free(label)
            LibC.free(creatorBundleName)
            LibC.free(groupName)
            LibC.free(appMessageId)
            LibC.free(hashCode)
            if (!distributedOption.isNull()) {
                let cDistributedOption = distributedOption.read()
                cDistributedOption.free()
            }
            LibC.free<CDistributedOptions>(distributedOption)
        }
    }
}

@C
struct CArrayNotificationRequestV2 {
    CArrayNotificationRequestV2(
        let head: CPointer<CPointer<CNotificationRequestV2>>,
        let size: Int64
    ) {}

    func free() {
        if (head.isNotNull()) {
            unsafe {
                for (i in 0..size) {
                    head.read(i).read().free()
                }
                LibC.free<CPointer<CNotificationRequestV2>>(head)
            }
        }
    }
}
