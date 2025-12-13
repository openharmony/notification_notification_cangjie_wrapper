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

package ohos.notification_flags

import ohos.business_exception.BusinessException
import ohos.labels.APILevel

/**
 * Enumerates the notification flag statuses.
 */
@!APILevel[
    since: "24",
    syscap: "SystemCapability.Notification.Notification"
]
public enum NotificationFlagStatus {
    /**
     * The default flag is used. The effect is the same as that of TypeNone.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    TypeNone
    |
    /**
     * The notification flag is enabled.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    TypeOpen
    |
    /**
     * The notification flag is disabled.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    TypeClose
    | ...

    func getValue(): Int32 {
        match (this) {
            case TypeNone => 0
            case TypeOpen => 1
            case TypeClose => 2
            case _ => throw BusinessException(1600001, "Internal error.")
        }
    }

    static func parse(value: Int32): NotificationFlagStatus {
        match (value) {
            case 0 => TypeNone
            case 1 => TypeOpen
            case 2 => TypeClose
            case _ => throw BusinessException(1600001, "Internal error.")
        }
    }
}

/**
 * Describes a NotificationFlags instance.
 */
@!APILevel[
    since: "24",
    syscap: "SystemCapability.Notification.Notification"
]
public class NotificationFlags {
    /**
     * Whether to enable sound reminder.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public let soundEnabled: NotificationFlagStatus
    /**
     * Whether to enable vibration reminder.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public let vibrationEnabled: NotificationFlagStatus

    /**
     * Create NotificationFlags instance.
     *
     * @param { NotificationFlagStatus } [ soundEnabled ] - Whether to enable sound reminder.
     * @param { NotificationFlagStatus } [ vibrationEnabled ] - Whether to enable vibration reminder.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public init(
        soundEnabled!: NotificationFlagStatus = TypeNone,
        vibrationEnabled!: NotificationFlagStatus = TypeNone
    ) {
        this.soundEnabled = soundEnabled
        this.vibrationEnabled = vibrationEnabled
    }

    protected init(flags: CNotificationFlags) {
        soundEnabled = NotificationFlagStatus.parse(flags.soundEnabled)
        vibrationEnabled = NotificationFlagStatus.parse(flags.vibrationEnabled)
    }

    protected func toCNotificationFlags(): CNotificationFlags {
        return CNotificationFlags(
            soundEnabled.getValue(),
            vibrationEnabled.getValue()
        )
    }
}
