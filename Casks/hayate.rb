# Hayate の Homebrew cask。version と sha256 は .github/workflows/bump.yml が書き換える。
cask "hayate" do
  version "0.1.8"
  sha256 "563471a941de56e404978380c0327998da615782629df0a3fb3b6fc08310ef46"

  url "https://downloads.hayate.im/Hayate-#{version}.pkg"
  name "Hayate"
  desc "Japanese input method that converts as you type, with a local LLM"
  homepage "https://hayate.im/"

  # 新しい版はサイトのダウンロードの先（Hayate-x.y.z.pkg）から読む。
  livecheck do
    url :homepage
    regex(/Hayate[._-]v?(\d+(?:\.\d+)+)\.pkg/i)
  end

  # アプリ自身が Sparkle で更新するので、brew upgrade は版の記録を合わせるだけ。
  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sequoia

  pkg "Hayate-#{version}.pkg"

  # 消すのは .pkg が置いたものだけ。入力ソースからは先に外してもらう（caveats）。
  uninstall pkgutil: "dev.hayate.inputmethod.HayateIME.pkg",
            delete:  [
              "/Library/Application Support/Hayate",
              "/Library/Input Methods/HayateIME.app",
            ]

  # 学習・辞書・設定（サンドボックスのコンテナ）。zap でだけ消す。
  zap trash: "~/Library/Containers/dev.hayate.inputmethod.HayateIME"

  caveats <<~EOS
    入力ソースに追加してから使えます:
      システム設定 → キーボード → 入力ソース → 「編集…」→「＋」→ 日本語 → Hayate

    消すときは、先に入力ソースから Hayate を「−」で外してから
    brew uninstall --cask hayate を実行してください。学習した内容は残ります
    （消すなら brew uninstall --zap --cask hayate）。
  EOS
end
