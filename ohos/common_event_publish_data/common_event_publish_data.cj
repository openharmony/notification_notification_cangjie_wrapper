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

package ohos.common_event_publish_data

import std.collection.HashMap
import ohos.labels.APILevel
import ohos.value_type.{ValueType, CArrParameters, CParameters, createCpCString, createCArrParam}
import ohos.ffi.{CArrString, CTypeResource}

/**
 * The CommonEventPublishData module provides APIs for defining common event content and attributes.
 *
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.Notification.CommonEvent"
]
public class CommonEventPublishData {
    /**
     * Bundle name of the subscriber that can receive the common event.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public var bundleName: String
    /**
     * Common event data transferred by the publisher. The default value is 0.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public var code: Int32
    /**
     * Common event data transferred by the publisher. The data size cannot exceed 64 KB.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public var data: String
    /**
     * Permissions required for subscribers to receive the common event.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public var subscriberPermissions: Array<String>
    /**
     * Whether the common event is an ordered one.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public var isOrdered: Bool
    /**
     * Whether the common event is a sticky one. Only system applications and system services are allowed to
     * send sticky events.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent",
        permission: "ohos.permission.COMMONEVENT_STICKY"
    ]
    public var isSticky: Bool
    /**
     * Additional information about the common event transferred by the publisher.
     *
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public var parameters: HashMap<String, ValueType>
    /**
     * init the CommonEventPublishData
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public init(
        bundleName!: String = "",
        data!: String = "",
        code!: Int32 = 0,
        subscriberPermissions!: Array<String> = Array<String>(),
        isOrdered!: Bool = false,
        isSticky!: Bool = false,
        parameters!: HashMap<String, ValueType> = HashMap<String, ValueType>()
    ) {
        this.bundleName = bundleName
        this.data = data
        this.code = code
        this.subscriberPermissions = subscriberPermissions
        this.isOrdered = isOrdered
        this.isSticky = isSticky
        this.parameters = parameters
    }
}

@C
protected struct CCommonEventPublishData {
    var bundleName: CString = CString(CPointer())
    var data: CString = CString(CPointer())
    let code: Int32
    var permissions: CArrString = CArrString(CPointer<CString>(), 0)
    let isOrdered: Bool
    let isSticky: Bool
    var parameters: CArrParameters = CArrParameters(CPointer<CParameters>(), 0)
    protected init(c: CommonEventPublishData) {
        unsafe {
            try {
                this.code = c.code
                this.isOrdered = c.isOrdered
                this.isSticky = c.isSticky
                this.bundleName = LibC.mallocCString(c.bundleName)
                this.data = LibC.mallocCString(c.data)
                if (c.subscriberPermissions.size != 0) {
                    this.permissions = CArrString(
                        createCpCString(c.subscriberPermissions),
                        c.subscriberPermissions.size
                    )
                }
                if (c.parameters.size != 0) {
                    this.parameters = createCArrParam(c.parameters)
                }
            } catch (e: Exception) {
                free()
                throw e
            }
        }
    }

    func free(): Unit {
        unsafe {
            LibC.free(bundleName)
            LibC.free(data)
            for (i in 0..permissions.size) {
                LibC.free(permissions.head.read(i))
            }
            LibC.free(permissions.head)
            parameters.free()
        }
    }

    protected func asResource(): CTypeResource<CCommonEventPublishData> {
        return CTypeResource(this, free)
    }
}
