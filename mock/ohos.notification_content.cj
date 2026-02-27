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

package ohos.notification_content

import ohos.labels.APILevel
import ohos.multimedia.image.PixelMap

@!APILevel[
    since: "24",
    syscap: "SystemCapability.Notification.Notification"
]
public enum ContentType {
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    NotificationContentBasicText
    |
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    NotificationContentLongText
    |
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    NotificationContentPicture
    |
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    NotificationContentConversation
    |
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    NotificationContentMultiline
    |
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    NotificationContentSystemLiveView
    |
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    NotificationContentLiveView
    | ...
}

@!APILevel[
    since: "24",
    syscap: "SystemCapability.Notification.Notification"
]
public class NotificationContent {
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var notificationContentType: ContentType

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var normal: ?NotificationBasicContent

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var longText: ?NotificationLongTextContent

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var multiLine: ?NotificationMultiLineContent

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var picture: ?NotificationPictureContent

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var systemLiveView: ?NotificationSystemLiveViewContent

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
}

@!APILevel[
    since: "24",
    syscap: "SystemCapability.Notification.Notification"
]
public open class NotificationBasicContent {
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var title: String

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var text: String

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var additionalText: String

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var lockscreenPicture: ?PixelMap

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
}

@!APILevel[
    since: "24",
    syscap: "SystemCapability.Notification.Notification"
]
public class NotificationLongTextContent <: NotificationBasicContent {
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var longText: String

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var briefText: String

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var expandedTitle: String

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
}

@!APILevel[
    since: "24",
    syscap: "SystemCapability.Notification.Notification"
]
public class NotificationMultiLineContent <: NotificationBasicContent {
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var briefText: String

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var longTitle: String

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var lines: Array<String>

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
}

@!APILevel[
    since: "24",
    syscap: "SystemCapability.Notification.Notification"
]
public class NotificationPictureContent <: NotificationBasicContent {
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var briefText: String

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var expandedTitle: String

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var picture: PixelMap

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
}

@!APILevel[
    since: "24",
    syscap: "SystemCapability.Notification.Notification"
]
public class NotificationSystemLiveViewContent <: NotificationBasicContent {
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var typeCode: Int32

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var capsule: NotificationCapsule

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var button: NotificationButton

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var time: NotificationTime

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var progress: NotificationProgress

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
}

@!APILevel[
    since: "24",
    syscap: "SystemCapability.Notification.Notification"
]
public class NotificationCapsule {
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var title: String

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var icon: ?PixelMap

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var backgroundColor: String

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
}

@!APILevel[
    since: "24",
    syscap: "SystemCapability.Notification.Notification"
]
public class NotificationButton {
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var names: Array<String>

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var icons: Array<PixelMap>

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
}

@!APILevel[
    since: "24",
    syscap: "SystemCapability.Notification.Notification"
]
public class NotificationTime {
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var initialTime: Int32

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var isCountDown: Bool

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var isPaused: Bool

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var isInTitle: Bool

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
}

@!APILevel[
    since: "24",
    syscap: "SystemCapability.Notification.Notification"
]
public class NotificationProgress {
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var maxValue: Int32

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var currentValue: Int32

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var isPercentage: Bool

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
}
