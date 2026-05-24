class TWhisper < Formula
  desc "本機離線中文語音轉錄 CLI（whisper.cpp + sherpa-onnx，繁體輸出）"
  homepage "https://github.com/sssuperman/T-Whisper"
  url "https://github.com/sssuperman/T-Whisper/releases/download/v1.1.0/t-whisper"
  version "1.1.0"
  sha256 "4170214257121723d817a96c4ae08eea6132ebe05fa402f9596ce3247682072e"
  license "MIT"

  depends_on "opencc"
  depends_on :macos

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
