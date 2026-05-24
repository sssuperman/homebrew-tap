class TWhisper < Formula
  desc "本機離線中文語音轉錄 CLI（whisper.cpp + sherpa-onnx，繁體輸出）"
  homepage "https://github.com/sssuperman/T-Whisper"
  url "https://github.com/sssuperman/T-Whisper/releases/download/v1.1.1/t-whisper"
  sha256 "2d2422503d8b6524e4d69fee5942043a8d76b73930c1635c59a603e4c2a5b144"
  license "MIT"

  depends_on :macos
  depends_on "opencc"

  def install
    bin.install "t-whisper"
  end

  def caveats
    <<~EOS
      模型首次使用時自動下載（whisper turbo ~1.6G；--diarize 另需分離模型 ~35MB）。
      先檢查環境：  t-whisper doctor
      開始用：      t-whisper rec
    EOS
  end

  test do
    assert_match "t-whisper", shell_output("#{bin}/t-whisper --version")
  end
end
