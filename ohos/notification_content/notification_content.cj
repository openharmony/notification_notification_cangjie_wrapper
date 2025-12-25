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

package ohos.notification_content

import ohos.business_exception.BusinessException
import ohos.ffi.{safeMalloc, toArrayCString, CArrI64, cjArr2CArr}
import ohos.labels.APILevel
import ohos.multimedia.image.PixelMap

class NotificationBasicContentImpl {
    init() {}
}

/**
 * Enumerates the notification content types.
 */
@!APILevel[
    since: "24",
    syscap: "SystemCapability.Notification.Notification"
]
public enum ContentType {
    /**
     * Normal text notification.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    NotificationContentBasicText
    |
    /**
     * Long text notification.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    NotificationContentLongText
    |
    /**
     * Picture-attached notification.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    NotificationContentPicture
    |
    /**
     * Conversation notification.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    NotificationContentConversation
    |
    /**
     * Multi-line text notification.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    NotificationContentMultiline
    |
    /**
     * Live view notification. A third-party application cannot directly create a notification of this type.
     * After the system proxy creates a system live view, the third-party application releases a notification
     * with the same ID to update the specified content.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    NotificationContentSystemLiveView
    |
    /**
     * Common live view notification. Only system applications are supported.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    NotificationContentLiveView
    | ...

    func getValue(): Int32 {
        match (this) {
            case NotificationContentBasicText => 0
            case NotificationContentLongText => 1
            case NotificationContentPicture => 2
            case NotificationContentConversation => 3
            case NotificationContentMultiline => 4
            case NotificationContentSystemLiveView => 5
            case NotificationContentLiveView => 6
            case _ => throw BusinessException(1600001, "Internal error.")
        }
    }

    static func parse(value: Int32): ContentType {
        match (value) {
            case 0 => NotificationContentBasicText
            case 1 => NotificationContentLongText
            case 2 => NotificationContentPicture
            case 3 => NotificationContentConversation
            case 4 => NotificationContentMultiline
            case 5 => NotificationContentSystemLiveView
            case 6 => NotificationContentLiveView
            case _ => throw BusinessException(1600001, "Internal error.")
        }
    }
}

/**
 * Describes the notification contents.
 */
@!APILevel[
    since: "24",
    syscap: "SystemCapability.Notification.Notification"
]
public class NotificationContent {
    /**
     * Notification content type.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var notificationContentType: ContentType
    /**
     * Normal text.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var normal: ?NotificationBasicContent
    /**
     * Long text.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var longText: ?NotificationLongTextContent
    /**
     * Multi-line text.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var multiLine: ?NotificationMultiLineContent
    /**
     * Picture-attached.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var picture: ?NotificationPictureContent
    /**
     * System live view. A third-party application cannot directly create a notification of this type.
     * After the system proxy creates a system live view,
     * the third-party application releases a notification with the same ID to update the specified content.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var systemLiveView: ?NotificationSystemLiveViewContent

    /**
     * Create NotificationContent instance.
     *
     * @param { ContentType } notificationContentType - Notification content type.
     * @param { ?NotificationBasicContent } [ normal ] - Normal text.
     * @param { ?NotificationLongTextContent } [ longText ] - Long text.
     * @param { ?NotificationMultiLineContent } [ multiLine ] - Multi-line text.
     * @param { ?NotificationPictureContent } [ picture ] - Picture-attached.
     * @param { ?NotificationSystemLiveViewContent } [ systemLiveView ] - System live view.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public init(
        notificationContentType: ContentType,
        normal!: ?NotificationBasicContent = None,
        longText!: ?NotificationLongTextContent = None,
        multiLine!: ?NotificationMultiLineContent = None,
        picture!: ?NotificationPictureContent = None,
        systemLiveView!: ?NotificationSystemLiveViewContent = None
    ) {
        this.notificationContentType = notificationContentType
        this.normal = normal
        this.longText = longText
        this.multiLine = multiLine
        this.picture = picture
        this.systemLiveView = systemLiveView
    }

    protected func toCNotificationContent(): CNotificationContent {
        unsafe {
            var cContent = CNotificationContent()
            cContent.notificationContentType = notificationContentType.getValue()
            try {
                if (let Some(content) <- normal) {
                    cContent.normal = safeMalloc<CNotificationBasicContent>()
                    cContent.normal.write(content.toCNotificationBasicContent())
                }

                if (let Some(text) <- longText) {
                    cContent.longText = safeMalloc<CNotificationLongTextContent>()
                    cContent.longText.write(text.toCNotificationLongTextContent())
                }

                if (let Some(line) <- multiLine) {
                    cContent.multiLine = safeMalloc<CNotificationMultiLineContent>()
                    cContent.multiLine.write(line.toCNotificationMultiLineContent())
                }

                if (let Some(pic) <- picture) {
                    cContent.picture = safeMalloc<CNotificationPictureContent>()
                    cContent.picture.write(pic.toCNotificationPictureContent())
                }

                if (let Some(sys) <- systemLiveView) {
                    cContent.systemLiveView = safeMalloc<CNotificationSystemLiveViewContent>()
                    cContent.systemLiveView.write(sys.toCNotificationSystemLiveViewContent())
                }
            } catch (e: Exception) {
                cContent.free()
                throw BusinessException(1600012, "No memory space.")
            }

            return cContent
        }
    }
}

/**
 * Describes a normal text notification.
 */
@!APILevel[
    since: "24",
    syscap: "SystemCapability.Notification.Notification"
]
public open class NotificationBasicContent {
    private let impl_: NotificationBasicContentImpl = NotificationBasicContentImpl()
    /**
     * Notification title. It cannot be empty or exceed 1024 bytes. Excess content will be truncated.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var title: String
    /**
     * Notification content. It cannot be empty or exceed 3072 bytes. Excess content will be truncated.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var text: String
    /**
     * Additional information of the notification. It cannot exceed 3072 bytes. Excess content will be truncated.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var additionalText: String
    /**
     * Picture of a notification displayed on the lock screen. Currently, only the live view notification is supported.
     * The total number of the icon pixel bytes cannot exceed 192 KB which is obtained through getPixelBytesNumber.
     * The recommended icon size is 128 × 128 pixels.
     * The display effect depends on the device capability and notification center UI style.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var lockscreenPicture: ?PixelMap

    /**
     * Create NotificationBasicContent instance.
     *
     * @param { String } title - Notification title.
     * @param { String } text - Notification content.
     * @param { String } [ additionalText ] - Additional information of the notification.
     * @param { ?PixelMap } [ lockscreenPicture ] - Picture of a notification displayed on the lock screen.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public init(
        title: String,
        text: String,
        additionalText!: String = "",
        lockscreenPicture!: ?PixelMap = None
    ) {
        this.title = title
        this.text = text
        this.additionalText = additionalText
        this.lockscreenPicture = lockscreenPicture
    }

    func toCNotificationBasicContent(): CNotificationBasicContent {
        var basicContent = CNotificationBasicContent()
        if (let Some(pix) <- lockscreenPicture) {
            basicContent.lockscreenPicture = pix.getID()
        }
        try {
            unsafe {
                basicContent.title = LibC.mallocCString(title)
                basicContent.text = LibC.mallocCString(text)
                basicContent.additionalText = LibC.mallocCString(additionalText)
            }
        } catch (e: Exception) {
            basicContent.free()
            throw BusinessException(1600012, "No memory space.")
        }
        return basicContent
    }
}

/**
 * Describes the long text notification. This API is inherited from NotificationBasicContent.
 */
@!APILevel[
    since: "24",
    syscap: "SystemCapability.Notification.Notification"
]
public class NotificationLongTextContent <: NotificationBasicContent {
    /**
     * Long text of the notification. It cannot be an empty string and exceed 3072 bytes.
     * Excess content will be truncated.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var longText: String
    /**
     * Brief text of the notification. It cannot be empty or exceed 1024 bytes. Excess content will be truncated.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var briefText: String
    /**
     * Title of the notification in the expanded state. It cannot be empty or exceed 1024 bytes.
     * Excess content will be truncated.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var expandedTitle: String

    /**
     * Create NotificationLongTextContent instance.
     *
     * @param { String } title - Notification title.
     * @param { String } text - Notification content.
     * @param { String } longText - Long text of the notification.
     * @param { String } briefText - Brief text of the notification.
     * @param { String } expandedTitle - Title of the notification in the expanded state.
     * @param { String } [ additionalText ] - Additional information of the notification.
     * @param { ?PixelMap } [ lockscreenPicture ] - Picture of a notification displayed on the lock screen.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public init(
        title: String,
        text: String,
        longText: String,
        briefText: String,
        expandedTitle: String,
        additionalText!: String = "",
        lockscreenPicture!: ?PixelMap = None
    ) {
        super(title, text, additionalText: additionalText, lockscreenPicture: lockscreenPicture)
        this.longText = longText
        this.briefText = briefText
        this.expandedTitle = expandedTitle
    }

    func toCNotificationLongTextContent(): CNotificationLongTextContent {
        var longTxtContent = CNotificationLongTextContent()
        if (let Some(pix) <- lockscreenPicture) {
            longTxtContent.lockscreenPicture = pix.getID()
        }
        try {
            unsafe {
                longTxtContent.title = LibC.mallocCString(title)
                longTxtContent.text = LibC.mallocCString(text)
                longTxtContent.additionalText = LibC.mallocCString(additionalText)
                longTxtContent.longText = LibC.mallocCString(longText)
                longTxtContent.briefText = LibC.mallocCString(briefText)
                longTxtContent.expandedTitle = LibC.mallocCString(expandedTitle)
            }
        } catch (e: Exception) {
            longTxtContent.free()
            throw BusinessException(1600012, "No memory space.")
        }
        return longTxtContent
    }
}

/**
 * Describes the multi-line text notification. This API is inherited from NotificationBasicContent.
 */
@!APILevel[
    since: "24",
    syscap: "SystemCapability.Notification.Notification"
]
public class NotificationMultiLineContent <: NotificationBasicContent {
    /**
     * Brief text of the notification. It cannot be empty or exceed 1024 bytes.
     * Excess content will be truncated.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var briefText: String
    /**
     * Title of the notification in the expanded state. It cannot be empty or exceed 1024 bytes.
     * Excess content will be truncated.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var longTitle: String
    /**
     * Multi-line text of the notification. It cannot exceed 1024 bytes.
     * Excess content will be truncated.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var lines: Array<String>

    /**
     * Create NotificationMultiLineContent instance.
     *
     * @param { String } title - Notification title.
     * @param { String } text - Notification content.
     * @param { String } briefText - Brief text of the notification.
     * @param { String } longTitle - Title of the notification in the expanded state.
     * @param { Array<String> } lines - Multi-line text of the notification.
     * @param { String } [ additionalText ] - Additional information of the notification.
     * @param { ?PixelMap } [ lockscreenPicture ] - Picture of a notification displayed on the lock screen.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public init(
        title: String,
        text: String,
        briefText: String,
        longTitle: String,
        lines: Array<String>,
        additionalText!: String = "",
        lockscreenPicture!: ?PixelMap = None
    ) {
        super(title, text, additionalText: additionalText, lockscreenPicture: lockscreenPicture)
        this.briefText = briefText
        this.longTitle = longTitle
        this.lines = lines
    }

    func toCNotificationMultiLineContent(): CNotificationMultiLineContent {
        var multiLineContent = CNotificationMultiLineContent()
        if (let Some(pix) <- lockscreenPicture) {
            multiLineContent.lockscreenPicture = pix.getID()
        }
        try {
            unsafe {
                multiLineContent.title = LibC.mallocCString(title)
                multiLineContent.text = LibC.mallocCString(text)
                multiLineContent.additionalText = LibC.mallocCString(additionalText)
                multiLineContent.briefText = LibC.mallocCString(briefText)
                multiLineContent.longTitle = LibC.mallocCString(longTitle)
                multiLineContent.lines = toArrayCString(lines)
            }
        } catch (e: Exception) {
            multiLineContent.free()
            throw BusinessException(1600012, "No memory space.")
        }
        return multiLineContent
    }
}

/**
 * Describes the picture-attached notification. This API is inherited from NotificationBasicContent.
 */
@!APILevel[
    since: "24",
    syscap: "SystemCapability.Notification.Notification"
]
public class NotificationPictureContent <: NotificationBasicContent {
    /**
     * Brief text of the notification. It cannot be empty or exceed 1024 bytes.
     * Excess content will be truncated.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var briefText: String
    /**
     * Title of the notification in the expanded state. It cannot be empty or exceed 1024 bytes.
     * Excess content will be truncated.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var expandedTitle: String
    /**
     * Picture content of the notification. (The total number of bytes of image pixels cannot exceed 2 MB.)
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var picture: PixelMap

    /**
     * Create NotificationMultiLineContent instance.
     *
     * @param { String } title - Notification title.
     * @param { String } text - Notification content.
     * @param { String } briefText - Brief text of the notification.
     * @param { String } expandedTitle - Title of the notification in the expanded state.
     * @param { PixelMap } picture - Picture content of the notification.
     * @param { String } [ additionalText ] - Additional information of the notification.
     * @param { ?PixelMap } [ lockscreenPicture ] - Picture of a notification displayed on the lock screen.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public init(
        title: String,
        text: String,
        briefText: String,
        expandedTitle: String,
        picture: PixelMap,
        additionalText!: String = "",
        lockscreenPicture!: ?PixelMap = None
    ) {
        super(title, text, additionalText: additionalText, lockscreenPicture: lockscreenPicture)
        this.briefText = briefText
        this.expandedTitle = expandedTitle
        this.picture = picture
    }

    func toCNotificationPictureContent(): CNotificationPictureContent {
        var pictureContent = CNotificationPictureContent()
        if (let Some(pix) <- lockscreenPicture) {
            pictureContent.lockscreenPicture = pix.getID()
        }
        pictureContent.picture = picture.getID()
        try {
            unsafe {
                pictureContent.title = LibC.mallocCString(title)
                pictureContent.text = LibC.mallocCString(text)
                pictureContent.additionalText = LibC.mallocCString(additionalText)
                pictureContent.briefText = LibC.mallocCString(briefText)
                pictureContent.expandedTitle = LibC.mallocCString(expandedTitle)
            }
        } catch (e: Exception) {
            pictureContent.free()
            throw BusinessException(1600012, "No memory space.")
        }
        return pictureContent
    }
}

/**
 * Describes the system live view notification.
 * A third-party application cannot directly create a notification of this type.
 * After the system proxy creates a system live view, the third-party application releases a notification
 * with the same ID to update the specified content.
 * This API is inherited from NotificationBasicContent.
 */
@!APILevel[
    since: "24",
    syscap: "SystemCapability.Notification.Notification"
]
public class NotificationSystemLiveViewContent <: NotificationBasicContent {
    /**
     * Type code, which identifies the type of the service that invokes the API.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var typeCode: Int32
    /**
     * Capsule of the notification.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var capsule: NotificationCapsule
    /**
     * Button in the notification.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var button: NotificationButton
    /**
     * Time of the notification.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var time: NotificationTime
    /**
     * Progress of the notification.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var progress: NotificationProgress

    /**
     * Create NotificationMultiLineContent instance.
     *
     * @param { String } title - Notification title.
     * @param { String } text - Notification content.
     * @param { Int32 } typeCode - Type code, which identifies the type of the service that invokes the API.
     * @param { NotificationCapsule } [ capsule ] - Capsule of the notification.
     * @param { NotificationButton } [ button ] - Button in the notification.
     * @param { NotificationTime } [ time ] - Time of the notification.
     * @param { NotificationProgress } [ progress ] - Progress of the notification.
     * @param { String } [ additionalText ] - Additional information of the notification.
     * @param { ?PixelMap } [ lockscreenPicture ] - Picture of a notification displayed on the lock screen.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public init(
        title: String,
        text: String,
        typeCode: Int32,
        capsule!: NotificationCapsule = NotificationCapsule(),
        button!: NotificationButton = NotificationButton(),
        time!: NotificationTime = NotificationTime(),
        progress!: NotificationProgress = NotificationProgress(),
        additionalText!: String = "",
        lockscreenPicture!: ?PixelMap = None
    ) {
        super(title, text, additionalText: additionalText, lockscreenPicture: lockscreenPicture)
        this.typeCode = typeCode
        this.capsule = capsule
        this.button = button
        this.time = time
        this.progress = progress
    }

    func toCNotificationSystemLiveViewContent(): CNotificationSystemLiveViewContent {
        var sysLiveViewContent = CNotificationSystemLiveViewContent()
        if (let Some(pix) <- lockscreenPicture) {
            sysLiveViewContent.lockscreenPicture = pix.getID()
        }
        sysLiveViewContent.typeCode = typeCode
        try {
            unsafe {
                sysLiveViewContent.title = LibC.mallocCString(title)
                sysLiveViewContent.text = LibC.mallocCString(text)
                sysLiveViewContent.additionalText = LibC.mallocCString(additionalText)
                sysLiveViewContent.capsule = capsule.toCNotificationCapsule()
                sysLiveViewContent.button = button.toCNotificationButton()
                sysLiveViewContent.time = time.toCNotificationTime()
                sysLiveViewContent.progress = progress.toCNotificationProgress()
            }
        } catch (e: Exception) {
            sysLiveViewContent.free()
            throw BusinessException(1600012, "No memory space.")
        }
        return sysLiveViewContent
    }
}

/**
 * Describe the notification capsule.
 */
@!APILevel[
    since: "24",
    syscap: "SystemCapability.Notification.Notification"
]
public class NotificationCapsule {
    /**
     * Title of the capsule.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var title: String
    /**
     * Icon of the capsule.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var icon: ?PixelMap
    /**
     * Background color of the capsule.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var backgroundColor: String

    /**
     * Create NotificationCapsule instance.
     *
     * @param { String } [ title ] - Title of the capsule.
     * @param { ?PixelMap } [ icon ] - Icon of the capsule.
     * @param { String } [ backgroundColor ] - Background color of the capsule.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public init(
        title!: String = "",
        icon!: ?PixelMap = None,
        backgroundColor!: String = ""
    ) {
        this.title = title
        this.icon = icon
        this.backgroundColor = backgroundColor
    }

    func toCNotificationCapsule(): CNotificationCapsule {
        var capsule = CNotificationCapsule()
        if (let Some(v) <- icon) {
            capsule.icon = v.getID()
        }
        try {
            unsafe {
                capsule.title = LibC.mallocCString(title)
                capsule.backgroundColor = LibC.mallocCString(backgroundColor)
            }
        } catch (e: Exception) {
            capsule.free()
            throw BusinessException(1600012, "No memory space.")
        }
        return capsule
    }
}

/**
 * Describes the notification button.
 */
@!APILevel[
    since: "24",
    syscap: "SystemCapability.Notification.Notification"
]
public class NotificationButton {
    /**
     * Button names. A maximum of three names are supported.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var names: Array<String>
    /**
     * Button icons. A maximum of three icons are supported.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var icons: Array<PixelMap>

    /**
     * Create NotificationButton instance.
     *
     * @param { Array<String> } [ names ] - Button names. A maximum of three names are supported.
     * @param { Array<PixelMap> } [ icons ] - Button icons. A maximum of three icons are supported.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public init(
        names!: Array<String> = [],
        icons!: Array<PixelMap> = []
    ) {
        this.names = names
        this.icons = icons
    }

    func toCNotificationButton(): CNotificationButton {
        var button = CNotificationButton()
        try {
            let convert = {p: PixelMap => p.getID()}
            unsafe {
                button.names = toArrayCString(names)
                button.icons = CArrI64(cjArr2CArr<PixelMap, Int64>(icons, convert), icons.size)
            }
        } catch (e: Exception) {
            button.free()
            throw BusinessException(1600012, "No memory space.")
        }
        return button
    }
}

/**
 * Describes the notification timing information.
 */
@!APILevel[
    since: "24",
    syscap: "SystemCapability.Notification.Notification"
]
public class NotificationTime {
    /**
     * Start time, in milliseconds.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var initialTime: Int32
    /**
     * Whether to count down.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var isCountDown: Bool
    /**
     * Whether to pause the progress.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var isPaused: Bool
    /**
     * Whether the time is displayed in the title.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var isInTitle: Bool

    /**
     * Create NotificationTime instance.
     *
     * @param { Int32 } [ initialTime ] - Start time, in milliseconds.
     * @param { Bool } [ isCountDown ] - Whether to count down.
     * @param { Bool } [ isPaused ] - Whether to pause the progress.
     * @param { Bool } [ isInTitle ] - Whether the time is displayed in the title.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public init(
        initialTime!: Int32 = 0,
        isCountDown!: Bool = false,
        isPaused!: Bool = false,
        isInTitle!: Bool = false
    ) {
        this.initialTime = initialTime
        this.isCountDown = isCountDown
        this.isPaused = isPaused
        this.isInTitle = isInTitle
    }

    func toCNotificationTime(): CNotificationTime {
        CNotificationTime(initialTime, isCountDown, isPaused, isInTitle)
    }
}

/**
 * Describes the notification progress.
 */
@!APILevel[
    since: "24",
    syscap: "SystemCapability.Notification.Notification"
]
public class NotificationProgress {
    /**
     * Maximum progress value.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var maxValue: Int32
    /**
     * Current progress value.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var currentValue: Int32
    /**
     * Whether to show the progress in percentage.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var isPercentage: Bool

    /**
     * Create NotificationProgress instance.
     *
     * @param { Int32 } [ maxValue ] - Maximum progress value.
     * @param { Int32 } [ currentValue ] - Current progress value.
     * @param { Bool } [ isPercentage ] - Whether to show the progress in percentage.
     */
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public init(
        maxValue!: Int32 = 0,
        currentValue!: Int32 = 0,
        isPercentage!: Bool = false
    ) {
        this.maxValue = maxValue
        this.currentValue = currentValue
        this.isPercentage = isPercentage
    }

    func toCNotificationProgress(): CNotificationProgress {
        CNotificationProgress(maxValue, currentValue, isPercentage)
    }
}
