/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

package ohos.notification_request

import std.collection.HashMap
import ohos.app.ability.want_agent.WantAgent
import ohos.business_exception.BusinessException
import ohos.ffi.{toArrayCString, toCPointer}
import ohos.labels.{APILevel, Hide}
import ohos.multimedia.image.PixelMap
import ohos.notification_content.NotificationContent
import ohos.notification_flags.NotificationFlags

@!APILevel[
    since: "24",
    syscap: "SystemCapability.Notification.Notification"
]
public enum SlotType {
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    UnknownType
    |
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    SocialCommunication
    |
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    ServiceInformation
    |
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    ContentInformation
    |
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    LiveView
    |
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    CustomerService
    |
    @!Hide[isChecked: true]
    EmergencyInformation
    |
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    OtherTypes
    | ...
}

@!APILevel[
    since: "24",
    syscap: "SystemCapability.Notification.Notification"
]
public class NotificationRequest {
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var content: NotificationContent

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var id: Int32

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var appMessageId: String

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var notificationSlotType: SlotType

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var isOngoing: Bool

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var isUnremovable: Bool

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var deliveryTime: Int64

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var tapDismissed: Bool

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var autoDeletedTime: Int64

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var color: UInt32

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var colorEnabled: Bool

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var isAlertOnce: Bool

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var isStopwatch: Bool

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var isCountDown: Bool

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var isFloatingIcon: Bool

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var label: String

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var badgeIconStyle: Int32

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var showDeliveryTime: Bool

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var smallIcon: ?PixelMap

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var largeIcon: ?PixelMap

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var groupName: String

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public let creatorBundleName: String

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public let creatorUid: Int32

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public let creatorPid: Int32

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public let creatorUserId: Int32

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public let hashCode: String

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var distributedOption: DistributedOptions

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public let notificationFlags: NotificationFlags

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var badgeNumber: UInt32

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public init(
        content: NotificationContent,
        creatorBundleName!: String = "",
        creatorUid!: Int32 = 0,
        creatorPid!: Int32 = 0,
        creatorUserId!: Int32 = 0,
        hashCode!: String = "",
        notificationFlags!: NotificationFlags = NotificationFlags(),
        id!: Int32 = 0,
        appMessageId!: String = "",
        notificationSlotType!: SlotType = OtherTypes,
        isOngoing!: Bool = false,
        isUnremovable!: Bool = false,
        deliveryTime!: Int64 = 0,
        tapDismissed!: Bool = true,
        autoDeletedTime!: Int64 = -1,
        color!: UInt32 = 0,
        colorEnabled!: Bool = false,
        isAlertOnce!: Bool = false,
        isStopwatch!: Bool = false,
        isCountDown!: Bool = false,
        isFloatingIcon!: Bool = false,
        label!: String = "",
        badgeIconStyle!: Int32 = 0,
        showDeliveryTime!: Bool = false,
        smallIcon!: ?PixelMap = None,
        largeIcon!: ?PixelMap = None,
        groupName!: String = "",
        distributedOption!: DistributedOptions = DistributedOptions(),
        badgeNumber!: UInt32 = 0
    ) {
        this.content = content
        this.creatorBundleName = creatorBundleName
        this.creatorUid = creatorUid
        this.creatorPid = creatorPid
        this.creatorUserId = creatorUserId
        this.hashCode = hashCode
        this.notificationFlags = notificationFlags
        this.id = id
        this.appMessageId = appMessageId
        this.notificationSlotType = notificationSlotType
        this.isOngoing = isOngoing
        this.isUnremovable = isUnremovable
        this.deliveryTime = deliveryTime
        this.tapDismissed = tapDismissed
        this.autoDeletedTime = autoDeletedTime
        this.color = color
        this.colorEnabled = colorEnabled
        this.isAlertOnce = isAlertOnce
        this.isStopwatch = isStopwatch
        this.isCountDown = isCountDown
        this.isFloatingIcon = isFloatingIcon
        this.label = label
        this.badgeIconStyle = badgeIconStyle
        this.showDeliveryTime = showDeliveryTime
        this.smallIcon = smallIcon
        this.largeIcon = largeIcon
        this.groupName = groupName
        this.distributedOption = distributedOption
        this.badgeNumber = badgeNumber
    }
}

@!APILevel[
    since: "24",
    syscap: "SystemCapability.Notification.Notification"
]
public class DistributedOptions {
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var isDistributed: Bool

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var supportDisplayDevices: Array<String>

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var supportOperateDevices: Array<String>

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public init(
        isDistributed!: Bool = true,
        supportDisplayDevices!: Array<String> = Array<String>(),
        supportOperateDevices!: Array<String> = Array<String>()
    ) {
        this.isDistributed = isDistributed
        this.supportDisplayDevices = supportDisplayDevices
        this.supportOperateDevices = supportOperateDevices
    }
}
