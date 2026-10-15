# homebrew-hayate

[Hayate](https://hayate.im/) の Homebrew tap です。Hayate は打っているそばから漢字になる、
macOS 用の日本語入力です（macOS 15 以降・Apple Silicon）。

```bash
brew tap hayate-ime/hayate
brew install --cask hayate
```

入るものはサイトからダウンロードできるものと同じ署名済みの .pkg で、
`/Library/Input Methods/` に入ります（管理者のパスワードを一度聞かれます）。
入れたあとは システム設定 → キーボード → 入力ソース で Hayate を追加してください。

更新はアプリ自身が行います。brew の版の記録は `brew upgrade --cask hayate` で追いつきます。

消すときは、先に入力ソースから Hayate を外してから:

```bash
brew uninstall --cask hayate          # 学習した内容は残す
brew uninstall --zap --cask hayate    # 学習・辞書・設定も消す
```

入れ方の詳しい説明は https://hayate.im/docs/install/ にあります。

---

Homebrew tap for [Hayate](https://hayate.im/), a Japanese input method for macOS that
converts as you type. `brew tap hayate-ime/hayate && brew install --cask hayate`.
