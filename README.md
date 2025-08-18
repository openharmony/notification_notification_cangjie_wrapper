# notification_cangjie_wrapper

## Introduction

The notification_cangjie_wrapper is a Cangjie API encapsulated on OpenHarmony based on the capabilities of the Common Event Service (CES) Subsystem. OpenHarmony provides a CES for applications to subscribe to, publish, and unsubscribe from common events.

Common events in OpenHarmony are classified into system common events and custom common events.

- System common event: sent by the system based on system policies to the applications that have subscribed to the event. This type of event is typically system events published by key system services, such as HAP installation, update, and uninstallation.

- Custom common events: customized by applications to implement cross-application event communication.

Each application can subscribe to common events as required. After your application subscribes to a common event, the system sends it to your application every time the event is published. Such an event may be published by the system, other applications, or your own application.

### Architecture

![](figures/notification_cangjie_wrapper_architecture_en.png "notification_cangjie_wrapper Architecture")

## Directory Structure

```
base/notification/notification_cangjie_wrapper
│── ohos             # Cangjie Common Event and Notification code
├── figures          # architecture pictures
```

## Repositories Involved

[notification_common_event_service](https://gitee.com/openharmony/notification_common_event_service/blob/master)
