# Rust CLI Action

[![DeepWiki](https://deepwiki.com/badge.svg)](https://deepwiki.com/reigadegr/rust_cli_action)

> 一个用于构建和优化流行 Rust 命令行工具的自动化构建系统，支持多平台交叉编译和性能优化。

## 🚀 项目概述

Rust CLI Action 是一个全面的 CI/CD 基础设施，专门用于构建、优化和分发流行的 Rust 命令行工具。该系统通过 GitHub Actions 自动化构建流程，支持多种工具链和目标平台，并应用了先进的性能优化技术。

## ✨ 主要特性

### 🔧 支持的工具

本系统支持构建以下 11 个热门 Rust CLI 工具：

- **starship** - 快速、可定制的命令行提示符
- **ripgrep (rg)** - 高性能文本搜索工具
- **fd** - 简单、快速的文件查找工具
- **bat** - 带语法高亮的 cat 替代品
- **hyperfine** - 命令行基准测试工具
- **procs** - 现代化的 ps 替代品
- **eza** - 现代化的 ls 替代品
- **sd** - 直观的 sed 替代品
- **dust** - 直观的 du 替代品
- **tree-rs** - 目录树显示工具
- **doxx** - 文档生成工具

### 🏗️ 多平台支持

支持以下目标平台的交叉编译：

- **Linux**: `aarch64-unknown-linux-musl`, `x86_64-unknown-linux-musl`
- **Windows**: `x86_64-pc-windows-msvc`
- **macOS**: `aarch64-apple-darwin`, `x86_64-apple-darwin`

### ⚡ 性能优化

#### 内存分配器优化
- 使用 **mimalloc** 替换默认内存分配器，提升运行时性能
- 针对 `fd` 和 `ripgrep` 工具应用专门的内存分配器补丁

#### 编译器优化
支持两种工具链配置：
- **nightly** - 使用最新的 Rust 特性和优化
- **stable** - 使用稳定版本确保兼容性

高级编译优化选项包括：
- MIR 优化级别调整
- 内联优化
- 链接时优化 (LTO)
- 代码段优化
- 静态链接配置

## 🚀 快速开始

### 使用方法

1. **手动触发构建**：
   - 访问 GitHub Actions 页面
   - 选择 "Release Build" 工作流
   - 配置以下参数：
     - `TOOLCHAINS`: 选择 `nightly` 或 `stable`
     - `TARGET`: 选择目标平台

2. **构建流程**：
   - 自动克隆所有支持的工具源码
   - 应用性能优化补丁
   - 添加 mimalloc 内存分配器
   - 使用优化编译配置进行构建
   - 打包并上传构建产物

### 构建产物

构建完成后，二进制文件将作为 GitHub Artifacts 上传，命名格式为 `{TARGET}_cli`，保留 2 天。

## 🏗️ 架构设计

### 工作流架构

系统采用分层架构设计：

1. **编排层**: 主工作流和策略检查
2. **环境层**: 环境配置和依赖管理
3. **构建层**: 源码克隆、补丁应用和编译
4. **产物层**: 二进制收集和分发

### 动态脚本选择

系统实现智能的构建脚本选择机制：

根据工具链和平台参数动态选择对应的构建脚本（如 `build_nightly_linux.sh`），支持 6 种不同的构建配置组合。

## 🔧 技术栈

- **CI/CD**: GitHub Actions
- **语言**: Rust, Shell Script
- **交叉编译**: cargo-zigbuild, Zig
- **内存分配器**: mimalloc
- **构建工具**: Cargo, 平台特定工具链

## 📝 维护特性

系统包含自动化维护功能：
- 拉取最新项目代码
- 自动化打补丁优化性能
- 失败时的自动回滚机制

## 🤝 贡献

本项目专注于 Rust CLI 工具的性能优化和跨平台构建。如需贡献，请关注：

- 新工具的集成支持
- 性能优化补丁的改进
- 新平台目标的支持
- 构建脚本的优化

## 📄 许可证

请参考各个工具的原始许可证要求。
