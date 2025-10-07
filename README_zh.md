# 事件通知仓颉封装（beta特性）

## 简介

事件通知仓颉封装是在OpenHarmony上面向开发者使用仓颉语言进行应用开发时提供公共事件管理能力。OpenHarmony通过CES（Common Event Service，公共事件服务）为应用程序提供订阅、发布、退订公共事件的能力。当前开放的事件通知仓颉封装仅支持standard设备。

公共事件可分为系统公共事件和自定义公共事件。

- 系统公共事件：系统将收集到的事件信息，根据系统策略发送给订阅该事件的用户程序。 例如：系统关键服务发布的系统事件, hap安装，更新，卸载等。

- 自定义公共事件：应用自定义一些公共事件用来实现跨应用的事件通信能力。

每个应用都可以按需订阅公共事件，若应用订阅成功且相应订阅的公共事件发布，系统会把其发送给应用。这些公共事件可能来自系统、其他应用和应用自身。

## 系统架构

**图 1** 事件通知仓颉封装架构图

![事件通知仓颉封装架构图](figures/notification_cangjie_wrapper_architecture_zh.png)

如架构图所示：

接口层：

- 公共事件管理：面向开发者提供公共事件管理能力，包括创建订阅者、订阅、取消订阅、发布公共事件等。
  - 创建订阅者：面向开发者提供根据订阅信息创建公共事件订阅者的接口能力，其中订阅信息可以指定订阅的公共事件，事件发布者需要具备的权限，以及设定订阅者的优先级等。
  - 订阅：面向开发者提供指定订阅者的订阅接口能力，用于获取所订阅公共事件的相关信息，及设定公共事件的处理信息。
  - 取消订阅：面向开发者提供指定订阅者的取消订阅接口能力。
  - 发布公共事件：面向开发者提供发布指定内容与属性的公共事件的接口能力。

框架层：
- 公共事件管理封装：基于底层公共事件服务实现公共事件管理封装，包括创建订阅者、订阅、发布、退订公共事件的能力。

架构图中依赖部件引入说明：
- 公共事件服务：公共事件管理封装的依赖公共事件服务。
- hiviewdfx_cangjie_wrapper：公共事件管理封装依赖hiviewdfx_cangjie_wrapper提供的HiLog日志能力，用于在关键路径打印日志。
- cangjie_ark_interop：公共事件管理封装依赖cangjie_ark_interop提供的仓颉注解类定义和BusinessException异常类定义，用于对API进行标注，及在错误分支向用户抛出异常。

## 目录

```
base/notification/notification_cangjie_wrapper
├── figures         # 存放README中的架构图
└── ohos            # 仓颉事件通知接口实现
│   ├── common_event_data           # 公共事件数据模块
│   ├── common_event_manager        # 公共事件管理模块
│   ├── common_event_publish_data   # 公共事件发布数据模块
│   ├── common_event_subscribe_info # 公共事件订阅信息模块
│   ├── common_event_subscriber     # 公共事件订阅者模块
│   └── value_type                  # 公共事件多值类型实现
└── test            # 测试用例
    └── common_event_manager # 公共事件测试用例
```

## 使用说明

当前事件通知仓颉封装提供以下功能：

- 公共事件管理。

事件通知相关接口请参见[公共事件API文档](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop/blob/master/doc/API_Reference/source_zh_cn/apis/BasicServicesKit/cj-apis-common_event_manager.md)，相关开发指导请参见[公共事件开发指南](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop/tree/master/doc/Dev_Guide/source_zh_cn/basic-services/common-event)。

## 约束

与ArkTS提供的API能力相比，暂不支持以下功能：

- 用户通知服务。

## 参与贡献

欢迎广大开发者贡献代码、文档等，具体的贡献流程和方式请参见[参与贡献](https://gitcode.com/openharmony/docs/blob/master/zh-cn/contribute/%E5%8F%82%E4%B8%8E%E8%B4%A1%E7%8C%AE.md)。

## 相关仓

[arkcompiler_cangjie_ark_interop](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop)

[hiviewdfx_hiviewdfx_cangjie_wrapper](https://gitcode.com/openharmony-sig/hiviewdfx_hiviewdfx_cangjie_wrapper)

[notification_common_event_service](https://gitcode.com/openharmony/notification_common_event_service)
