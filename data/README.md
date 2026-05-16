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
  "idPrefix": "chuci",
  "layout": "center",
  "autoload": true
}
```

3. 如果希望侧边分类出现这个入口，在 `category-map.json` 的 `categoryGroups` 里添加标签。
4. 如果希望它能被“爱情、送别、哲理”等主题搜到，在 `category-map.json` 的 `categoryAliases` 里补关键词。

`layout` 可以填：

- `center`：默认，适合唐诗、宋词、三字经、千字文、声律启蒙等短句/韵文。
- `prose`：左对齐并两端对齐，适合古文观止、幼学琼林、论语、大学、中庸、孟子等长文。

`autoload` 可以填：

- `true` 或省略：网页打开时加载，适合小文件。
- `false`：点击对应分类时再加载，适合全唐诗、全宋词、元曲这类大库。

## 手动添加单篇内容

把 `custom-poems.example.json` 里的对象复制到 `custom-poems.json` 的数组里即可。

## 重新下载 chinese-poetry 数据

在项目根目录运行：

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\download-chinese-poetry.ps1
```


注释：
修改文章对齐方式：
  文件sources.json中，
  "center" 居中：适合三字经、千字文、唐诗宋词这类。 
  "prose"  左对齐/两端对齐：适合古文观止、幼学琼林、论语、大学、中庸、孟子这类。
