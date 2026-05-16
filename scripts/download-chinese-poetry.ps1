$ErrorActionPreference = "Stop"

$repoRaw = "https://raw.githubusercontent.com/chinese-poetry/chinese-poetry/master"
$root = Split-Path -Parent $PSScriptRoot

$files = @(
    @{ Url = "$repoRaw/%E8%92%99%E5%AD%A6/baijiaxing.json"; Target = "data/mengxue/baijiaxing.json" },
    @{ Url = "$repoRaw/%E8%92%99%E5%AD%A6/dizigui.json"; Target = "data/mengxue/dizigui.json" },
    @{ Url = "$repoRaw/%E8%92%99%E5%AD%A6/guwenguanzhi.json"; Target = "data/mengxue/guwenguanzhi.json" },
    @{ Url = "$repoRaw/%E8%92%99%E5%AD%A6/qianjiashi.json"; Target = "data/mengxue/qianjiashi.json" },
    @{ Url = "$repoRaw/%E8%92%99%E5%AD%A6/qianziwen.json"; Target = "data/mengxue/qianziwen.json" },
    @{ Url = "$repoRaw/%E8%92%99%E5%AD%A6/sanzijing-new.json"; Target = "data/mengxue/sanzijing-new.json" },
    @{ Url = "$repoRaw/%E8%92%99%E5%AD%A6/sanzijing-traditional.json"; Target = "data/mengxue/sanzijing-traditional.json" },
    @{ Url = "$repoRaw/%E8%92%99%E5%AD%A6/shenglvqimeng.json"; Target = "data/mengxue/shenglvqimeng.json" },
    @{ Url = "$repoRaw/%E8%92%99%E5%AD%A6/tangshisanbaishou.json"; Target = "data/mengxue/tangshisanbaishou.json" },
    @{ Url = "$repoRaw/%E8%92%99%E5%AD%A6/wenzimengqiu.json"; Target = "data/mengxue/wenzimengqiu.json" },
    @{ Url = "$repoRaw/%E8%92%99%E5%AD%A6/youxueqionglin.json"; Target = "data/mengxue/youxueqionglin.json" },
    @{ Url = "$repoRaw/%E8%92%99%E5%AD%A6/zengguangxianwen.json"; Target = "data/mengxue/zengguangxianwen.json" },
    @{ Url = "$repoRaw/%E8%92%99%E5%AD%A6/zhuzijiaxun.json"; Target = "data/mengxue/zhuzijiaxun.json" },

    @{ Url = "$repoRaw/%E8%AE%BA%E8%AF%AD/lunyu.json"; Target = "data/lunyu/lunyu.json" },

    @{ Url = "$repoRaw/%E5%9B%9B%E4%B9%A6%E4%BA%94%E7%BB%8F/daxue.json"; Target = "data/sishuwujing/daxue.json" },
    @{ Url = "$repoRaw/%E5%9B%9B%E4%B9%A6%E4%BA%94%E7%BB%8F/mengzi.json"; Target = "data/sishuwujing/mengzi.json" },
    @{ Url = "$repoRaw/%E5%9B%9B%E4%B9%A6%E4%BA%94%E7%BB%8F/zhongyong.json"; Target = "data/sishuwujing/zhongyong.json" }
)

foreach ($file in $files) {
    $targetPath = Join-Path $root $file.Target
    $targetDir = Split-Path -Parent $targetPath
    New-Item -ItemType Directory -Force -Path $targetDir | Out-Null
    Write-Host "Downloading $($file.Target)"
    Invoke-WebRequest -UseBasicParsing -Uri $file.Url -OutFile $targetPath
}

Write-Host "Done. Downloaded $($files.Count) files."
