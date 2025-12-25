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

import std.collection.HashMap
import ohos.app.ability.want_agent.WantAgent
import ohos.business_exception.BusinessException
import ohos.ffi.{toArrayCString, toCPointer}
import ohos.labels.{APILevel, Hide}
import ohos.multimedia.image.PixelMap
import ohos.notification_content.NotificationContent
import ohos.notification_flags.NotificationFlags
import ohos.notification_flags.CNotificationFlags
import ohos.notification_content.CNotificationContent

@!Hide
internal class NotificationActionButton {
    protected init() {}
}

@!Hide
internal class NotificationTemplate {
    protected init() {}
}

/**
 * Enumerates the notification slot types.
 */
@!APILevel[
    since: "24",
    syscap: "SystemCapability.Notification.Notification"
]
public enum SlotType {
    /**
     * Unknown type.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    UnknownType
    |
    /**
     * Notification slot for social communication.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    SocialCommunication
    |
    /**
     * Notification slot for service information.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    ServiceInformation
    |
    /**
     * Notification slot for content consultation.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    ContentInformation
    |
    /**
     * Live view. A third-party application cannot directly create a notification of this slot type.
     * After the system proxy creates a system live view, the third-party application releases a notification
     * with the same ID to update the specified content.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    LiveView
    |
    /**
     * Customer service message. This type is used for messages between users and customer service providers.
     * The messages must be initiated by users.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    CustomerService
    |
    @!Hide
    EmergencyInformation
    |
    /**
     * Notification slot for other purposes.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    OtherTypes
    | ...

    func getValue(): Int32 {
        match (this) {
            case UnknownType => 0
            case SocialCommunication => 1
            case ServiceInformation => 2
            case ContentInformation => 3
            case LiveView => 4
            case CustomerService => 5
            case OtherTypes => 0xFFFF
            case _ => throw BusinessException(1600001, "Internal error.")
        }
    }

    static func parse(value: Int32): SlotType {
        match (value) {
            case 0 => UnknownType
            case 1 => SocialCommunication
            case 2 => ServiceInformation
            case 3 => ContentInformation
            case 4 => LiveView
            case 5 => CustomerService
            case _ => OtherTypes
        }
    }
}

/**
 * Defines a NotificationRequest instance.
 */
@!APILevel[
    since: "24",
    syscap: "SystemCapability.Notification.Notification"
]
public class NotificationRequest {
    /**
     * Notification content.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var content: NotificationContent
    /**
     * Notification ID. The default value is 0. If the same notification ID exists, the notification content is updated.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var id: Int32
    /**
     * Unique ID carried in a notification sent by an app, which is used for notification deduplication.
     * If an app publishes notifications with the same appMessageId locally or on the cloud,
     * the device displays only one message.
     * Repeated notifications received later will be silenced and deduplicated, and will not be displayed or notified.
     * The deduplication flag is valid only within 24 hours after the notification is published.
     * After 24 hours or the device is restarted, the deduplication flag becomes invalid.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var appMessageId: String
    /**
     * Notification slot type. The default value is OtherTypes
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var notificationSlotType: SlotType
    /**
     * Whether the notification is an ongoing notification.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var isOngoing: Bool
    /**
     * Whether the notification can be removed.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var isUnremovable: Bool
    @!Hide
    internal var updateOnly: Bool = false
    /**
     * Time when the notification is sent. This API is automatically generated by the system.
     * Data format: timestamp, in milliseconds.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var deliveryTime: Int64
    /**
     * Whether the notification is automatically cleared.
     * This parameter is valid only when the notification carries wantAgent or actionButtons.
     * - true (default): The current notification is automatically cleared after the notification or button is tapped.
     * - false: The current notification is retained after the notification or button is tapped.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var tapDismissed: Bool
    /**
     * Time when the notification is automatically cleared. Data format: timestamp, in milliseconds.
     * For example, if a notification is to be cleared after being displayed for 3 seconds (3000 ms),
     * you can set new Date().getTime() + 3000 to meet this requirement.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var autoDeletedTime: Int64
    @!Hide
    internal var wantAgent: ?WantAgent = None
    @!Hide
    internal var extraInfo: HashMap<String, Any> = HashMap<String, Any>()
    @!Hide
    internal var extendInfo: HashMap<String, Any> = HashMap<String, Any>()
    /**
     * Background color of the notification.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var color: UInt32
    /**
     * Whether the notification background color can be enabled.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var colorEnabled: Bool
    /**
     * Whether to send a notification only once when the notification is published or updated.
     * - true: A notification is sent only when the notification is published for the first time.
     * - false (default): A notification is sent based on the configured notification mode.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var isAlertOnce: Bool
    /**
     * Whether to display the stopwatch.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var isStopwatch: Bool
    /**
     * Whether to display the countdown time.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var isCountDown: Bool
    /**
     * Whether the notification is displayed as a floating icon in the status bar.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var isFloatingIcon: Bool
    /**
     * Notification label. The label field can be used independently,
     * or used together with ID as a notification identifier. ID is preferentially used.
     * If the label is not empty when a notification is published,
     * you need to specify the label when updating or deleting the notification.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var label: String
    /**
     * Notification badge type.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var badgeIconStyle: Int32
    /**
     * Whether to display the time when the notification is delivered.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var showDeliveryTime: Bool
    @!Hide
    internal var actionButtons: Array<NotificationActionButton> = Array<NotificationActionButton>()
    /**
     * Small notification icon. Optional field. The total number of the icon pixel bytes cannot exceed 192 KB
     * which is obtained through getPixelBytesNumber. The recommended icon size is 128 px × 128 px.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var smallIcon: ?PixelMap
    /**
     * Large notification icon. Optional field. The total number of the icon pixel bytes cannot exceed 192 KB
     * which is obtained through getPixelBytesNumber. The recommended icon size is 128 px × 128 px.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var largeIcon: ?PixelMap
    @!Hide
    internal var overlayIcon: ?PixelMap = None
    /**
     * Notification group name. This parameter is left blank by default.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var groupName: String
    /**
     * Name of the bundle that creates the notification.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public let creatorBundleName: String
    /**
     * UID used for creating the notification.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public let creatorUid: Int32
    /**
     * PID used for creating the notification.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public let creatorPid: Int32
    /**
     * ID of the user who creates the notification.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public let creatorUserId: Int32
    @!Hide
    internal let creatorInstanceKey: Int32 = -1
    @!Hide
    internal var sound: String = ""
    @!Hide
    internal var classification: String = ""
    /**
     * Unique ID of the notification.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public let hashCode: String
    @!Hide
    internal var isRemoveAllowed: Bool = true
    @!Hide
    internal let source: Int32 = 0
    @!Hide
    internal var template: ?NotificationTemplate = None
    /**
     * Distributed notification options. Not supported currently.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var distributedOption: DistributedOptions
    @!Hide
    internal let deviceId: String = ""
    /**
     * Notification flags.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public let notificationFlags: NotificationFlags
    @!Hide
    internal let removalWantAgent: ?WantAgent = None
    /**
     * Number of notifications displayed on the application icon. If the badgeNumber is set to 0, badges are cleared;
     * if the value is greater than 99, 99+ is displayed on the badge.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var badgeNumber: UInt32

    /**
     * Create NotificationRequest instance.
     *
     * @param { NotificationContent } content - Notification content.
     * @param { String } [ creatorBundleName ] - Name of the bundle that creates the notification.
     * @param { Int32 } [ creatorUid ] - UID used for creating the notification.
     * @param { Int32 } [ creatorPid ] - PID used for creating the notification.
     * @param { Int32 } [ creatorUserId ] - ID of the user who creates the notification.
     * @param { String } [ hashCode ] - Unique ID of the notification.
     * @param { NotificationFlags } [ notificationFlags ] - Notification flags.
     * @param { Int32 } [ id ] - Notification ID.
     * @param { String } [ appMessageId ] - Unique ID carried in a notification sent by an app,
     * which is used for notification deduplication.
     * @param { SlotType } [ notificationSlotType ] - Notification slot type.
     * @param { Bool } [ isOngoing ] - Whether the notification is an ongoing notification.
     * @param { Bool } [ isUnremovable ] - Whether the notification can be removed.
     * @param { Int64 } [ deliveryTime ] - Time when the notification is sent.
     * @param { Bool } [ tapDismissed ] - Whether the notification is automatically cleared.
     * @param { Int64 } [ autoDeletedTime ] - Time when the notification is automatically cleared.
     * @param { UInt32 } [ color ] - Background color of the notification.
     * @param { Bool } [ colorEnabled ] - Whether the notification background color can be enabled.
     * @param { Bool } [ isAlertOnce ] - Whether to send a notification only once
     * when the notification is published or updated.
     * @param { Bool } [ isStopwatch ] - Whether to display the stopwatch.
     * @param { Bool } [ isCountDown ] - Whether to display the countdown time.
     * @param { Bool } [ isFloatingIcon ] - Whether the notification is displayed as a floating icon in the status bar.
     * @param { String } [ label ] - Notification label.
     * @param { Int32 } [ badgeIconStyle ] - Notification badge type.
     * @param { Bool } [ showDeliveryTime ] - Whether to display the time when the notification is delivered.
     * @param { ?PixelMap } [ smallIcon ] - Small notification icon.
     * @param { ?PixelMap } [ largeIcon ] - Large notification icon.
     * @param { String } [ groupName ] - Notification group name. This parameter is left blank by default.
     * @param { DistributedOptions } [ distributedOption ] - Distributed notification options.
     * @param { UInt32 } [ badgeNumber ] - Number of notifications displayed on the application icon.
     */
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

    init(request: CNotificationRequestV2) {
        content = request.content.parse()
        id = request.id
        notificationSlotType = SlotType.parse(request.notificationSlotType)
        isOngoing = request.isOngoing
        isUnremovable = request.isUnremovable
        deliveryTime = request.deliveryTime
        tapDismissed = request.tapDismissed
        autoDeletedTime = request.autoDeletedTime
        color = request.color
        colorEnabled = request.colorEnabled
        isAlertOnce = request.isAlertOnce
        isStopwatch = request.isStopwatch
        isCountDown = request.isCountDown
        isFloatingIcon = request.isFloatingIcon
        label = request.label.toString()
        badgeIconStyle = request.badgeIconStyle
        showDeliveryTime = request.showDeliveryTime
        smallIcon = if (request.smallIcon == -1) {
            None
        } else {
            Some(PixelMap(request.smallIcon))
        }
        largeIcon = if (request.largeIcon == -1) {
            None
        } else {
            Some(PixelMap(request.largeIcon))
        }
        creatorBundleName = request.creatorBundleName.toString()
        groupName = request.groupName.toString()
        distributedOption = if (request.distributedOption.isNull()) {
            DistributedOptions()
        } else {
            unsafe { DistributedOptions(request.distributedOption.read()) }
        }
        notificationFlags = NotificationFlags(request.notificationFlags)
        badgeNumber = request.badgeNumber
        creatorUid = request.creatorUid
        creatorPid = request.creatorPid
        creatorUserId = request.creatorUserId
        hashCode = request.hashCode.toString()
        appMessageId = request.appMessageId.toString()
    }

    protected func toCNotificationRequest(): CNotificationRequestV2 {
        var request = CNotificationRequestV2(CNotificationContent(), id, notificationSlotType.getValue(), isOngoing,
            isUnremovable, deliveryTime, tapDismissed, autoDeletedTime, color, colorEnabled, isAlertOnce, isStopwatch,
            isCountDown, isFloatingIcon, CString(CPointer()), badgeIconStyle, showDeliveryTime, -1, -1,
            CString(CPointer()), creatorUid, creatorPid, creatorUserId, CString(CPointer()), CString(CPointer()),
            CPointer<CDistributedOptions>(), CNotificationFlags(0, 0), badgeNumber, CString(CPointer()))
        unsafe {
            try {
                request.content = content.toCNotificationContent()
                request.label = LibC.mallocCString(label)
                request.groupName = LibC.mallocCString(groupName)
                request.creatorBundleName = LibC.mallocCString(creatorBundleName)
                request.hashCode = LibC.mallocCString(hashCode)
                request.appMessageId = LibC.mallocCString(appMessageId)
                let convert = {p: DistributedOptions => p.toCDistributedOptions()}
                request.distributedOption =
                    toCPointer<DistributedOptions, CDistributedOptions>(distributedOption, convert)
            } catch (e: Exception) {
                request.free()
                throw BusinessException(1600012, "No memory space.")
            }
        }
        if (let Some(icon) <- smallIcon) {
            request.smallIcon = icon.getID()
        }
        if (let Some(icon) <- largeIcon) {
            request.largeIcon = icon.getID()
        }
        request.notificationFlags = notificationFlags.toCNotificationFlags()
        return request
    }
}

/**
 * Describes distributed notification options.
 */
@!APILevel[
    since: "24",
    syscap: "SystemCapability.Notification.Notification"
]
public class DistributedOptions {
    /**
     * Whether the notification is a distributed notification.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var isDistributed: Bool
    /**
     * List of the devices to which the notification can be synchronized.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var supportDisplayDevices: Array<String>
    /**
     * List of the devices on which the notification can be opened.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var supportOperateDevices: Array<String>

    /**
     * Create NotificationRequest instance.
     *
     * @param { Bool } [ isDistributed ] - Whether the notification is a distributed notification.
     * @param { Array<String> } [ supportDisplayDevices ] - List of the devices to which the notification can be synchronized.
     * @param { Array<String> } [ supportOperateDevices ] - List of the devices on which the notification can be opened.
     */
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

    init(options: CDistributedOptions) {
        isDistributed = options.isDistributed
        let displaySize = options.supportDisplayDevices.size
        let displayHead = options.supportDisplayDevices.head
        supportDisplayDevices = unsafe { Array<String>(displaySize, {i => displayHead.read(i).toString()}) }
        let operateSize = options.supportOperateDevices.size
        let operateHead = options.supportOperateDevices.head
        supportOperateDevices = unsafe { Array<String>(operateSize, {i => operateHead.read(i).toString()}) }
    }

    unsafe func toCDistributedOptions(): CDistributedOptions {
        var options = CDistributedOptions()
        options.isDistributed = isDistributed
        try {
            options.supportDisplayDevices = toArrayCString(supportDisplayDevices)
            options.supportOperateDevices = toArrayCString(supportOperateDevices)
        } catch (e: Exception) {
            options.free()
            throw BusinessException(1600012, "No memory space.")
        }
        return options
    }
}
