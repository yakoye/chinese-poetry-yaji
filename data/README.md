# 数据添加说明

这个站点的数据由 `sources.json` 驱动。

## 添加一个新的 JSON 数据文件

1. 把文件放到 `data/` 下，例如 `data/chuci/chuci.json`。
2. 在 `sources.json` 里添加一项：

```json
{
  "path": "./data/chuci/chuci.json",
  "category": "楚辞",
  "dynasty": "先秦",
  "idPrefix": "chuci"
}
```

3. 如果希望侧边分类出现这个入口，在 `category-map.json` 的 `categoryGroups` 里添加标签。
4. 如果希望它能被“爱情、送别、哲理”等主题搜到，在 `category-map.json` 的 `categoryAliases` 里补关键词。

## 手动添加单篇内容

把 `custom-poems.example.json` 里的对象复制到 `custom-poems.json` 的数组里即可。

## 重新下载 chinese-poetry 数据

在项目根目录运行：

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\download-chinese-poetry.ps1
```
