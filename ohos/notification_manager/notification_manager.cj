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

package ohos.notification_manager

import ohos.app.ability.ui_ability.UIAbilityContext
import ohos.hilog.HilogChannel
import ohos.labels.APILevel

public import ohos.notification_flags.{NotificationFlags, NotificationFlagStatus}
public import ohos.notification_content.{ContentType, NotificationContent, NotificationBasicContent,
    NotificationLongTextContent, NotificationMultiLineContent, NotificationPictureContent,
    NotificationSystemLiveViewContent, NotificationCapsule, NotificationButton,
    NotificationTime, NotificationProgress}
public import ohos.notification_request.{SlotType, NotificationRequest, DistributedOptions}

let NOTIFICATION_LOG = HilogChannel(0, NOTIFICATION_DOMAIN_ID, "CJ-notification")

/**
 * Publish a notification.
 * If the ID and label of the new notification are the same as that of the previous notification,
 * the new one replaces the previous one.
 * @param { NotificationRequest } request - ontent and related configuration of the notification to publish.
 * @throws { BusinessException } 1600001 - Internal error.
 * @throws { BusinessException } 1600002 - Marshalling or unmarshalling error.
 * @throws { BusinessException } 1600003 - Failed to connect to the service.
 * @throws { BusinessException } 1600004 - Notification disabled.
 * @throws { BusinessException } 1600005 - Notification slot disabled.
 * @throws { BusinessException } 1600007 - The notification does not exist.
 * @throws { BusinessException } 1600009 - The notification sending frequency reaches the upper limit.
 * @throws { BusinessException } 1600012 - No memory space.
 * @throws { BusinessException } 1600014 - No permission.
 * @throws { BusinessException } 1600015 - The current notification status does not support duplicate configurations.
 * @throws { BusinessException } 1600016 - The notification version for this update is too low.
 * @throws { BusinessException } 1600020 - The application is not allowed to send notifications due to permission settings.
 * @throws { BusinessException } 2300007 - Network unreachable.
 */
@!APILevel[
    since: "24",
    syscap: "SystemCapability.Notification.Notification",
    throwexception: true
]
public func publish(request: NotificationRequest): Unit {
    let cRequest = request.toCNotificationRequest()
    let code = unsafe { FfiOHOSNotificationManagerPublishV2(cRequest) }
    cRequest.free()
    throwIfNotSuccess(code)
}

/**
 * Cancels a notification with the specified ID and optional label.
 *
 * @param { Int32 } id - Notification ID.
 * @param { String } [ label ] - Notification label. This parameter is left empty by default.
 * @throws { BusinessException } 1600001 - Internal error.
 * @throws { BusinessException } 1600002 - Marshalling or unmarshalling error.
 * @throws { BusinessException } 1600003 - Failed to connect to the service.
 * @throws { BusinessException } 1600007 - The notification does not exist.
 */
@!APILevel[
    since: "24",
    syscap: "SystemCapability.Notification.Notification",
    throwexception: true
]
public func cancel(id: Int32, label!: String = ""): Unit {
    try (cLabel = unsafe { LibC.mallocCString(label).asResource() }) {
        let code = unsafe { FfiOHOSNotificationManagerCancelV2(id, cLabel.value) }
        throwIfNotSuccess(code)
    }
}

/**
 * Requests notification to be enabled for this application.
 * You can call this API to display a dialog box prompting the user to enable notification
 * for your application before publishing a notification.
 *
 * @param { UIAbilityContext } context - Application context.
 * @throws { BusinessException } 1600001 - Internal error.
 * @throws { BusinessException } 1600002 - Marshalling or unmarshalling error.
 * @throws { BusinessException } 1600003 - Failed to connect to the service.
 * @throws { BusinessException } 1600004 - Notification disabled.
 * @throws { BusinessException } 1600013 - A notification dialog box is already displayed.
 */
@!APILevel[
    since: "24",
    syscap: "SystemCapability.Notification.Notification",
    throwexception: true
]
public func requestEnableNotification(context: UIAbilityContext): Unit {
    let code = unsafe { FfiOHOSNotificationManagerRequestEnableNotificationWithContextV2(context.getID()) }
    throwIfNotSuccess(code)
}
