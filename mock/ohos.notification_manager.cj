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

package ohos.notification_manager

import ohos.app.ability.ui_ability.UIAbilityContext
import ohos.labels.APILevel

public import ohos.notification_flags.{NotificationFlags, NotificationFlagStatus}
public import ohos.notification_content.{ContentType, NotificationContent, NotificationBasicContent,
    NotificationLongTextContent, NotificationMultiLineContent, NotificationPictureContent,
    NotificationSystemLiveViewContent, NotificationCapsule, NotificationButton,
    NotificationTime, NotificationProgress}
public import ohos.notification_request.{SlotType, NotificationRequest, DistributedOptions}

@!APILevel[
    since: "24",
    syscap: "SystemCapability.Notification.Notification",
    throwexception: true
]
public func publish(request: NotificationRequest): Unit {
    return ()
}

@!APILevel[
    since: "24",
    syscap: "SystemCapability.Notification.Notification",
    throwexception: true
]
public func cancel(id: Int32, label!: String = ""): Unit {
    return ()
}

@!APILevel[
    since: "24",
    syscap: "SystemCapability.Notification.Notification",
    throwexception: true
]
public func requestEnableNotification(context: UIAbilityContext): Unit {
    return ()
}
