![ReleaseBadge](https://badges.cds.internal.unity3d.com/packages/com.unity.timeline/release-badge.svg)
![ReleaseBadge](https://badges.cds.internal.unity3d.com/packages/com.unity.timeline/candidates-badge.svg)

# About Timeline

Use Unity’s Timeline to create cinematic content, game-play sequences, audio sequences, and complex particle effects.

# Installing Timeline

To install this package, follow the instructions in the [Package Manager documentation](https://docs.unity3d.com/Packages/com.unity.package-manager-ui@latest/index.html).

# Using Timeline

The Timeline Manual can be found [here](http://docs.hq.unity3d.com/2018.1/Documentation/Manual/TimelineSection.html)

# Technical details
## Requirements

This version of Timeline is compatible with the following versions of the Unity Editor:

* 2019.3 and later (recommended)

# How to format your code for the repo

Clone https://github.cds.internal.unity3d.com/unity/git-hgmeta-format/tree/csharp-format (the branch is important):
```bash
git clone --single-branch --branch csharp-format git@github.cds.internal.unity3d.com:unity/git-hgmeta-format.git
```
go in your repo clone and run
```bash
perl <gitformat clone dir>/hooks/install-hooks.pl
```
If you have things already committed without the formatting, run
```bash
perl <gitformat clone dir>/format.pl branch
```
where `branch` is litteraly `branch` and not `$BRANCHNAME`
