class DjangoLanguageServer < Formula
  desc "Language server and template checker for Django"
  homepage "https://github.com/joshuadavidthomas/django-language-server"
  version "6.0.3"
  license "Apache-2.0"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/joshuadavidthomas/django-language-server/releases/download/v#{version}/" \
          "django-language-server-v#{version}-darwin-arm64.tar.gz"
      sha256 "fcacf74f411cc789ab07547f83c153a99cef1f6aefe0d55589086719530c0e24"
    end

    on_intel do
      url "https://github.com/joshuadavidthomas/django-language-server/releases/download/v#{version}/" \
          "django-language-server-v#{version}-darwin-x64.tar.gz"
      sha256 "9ccbf0ae51e48b29ae878d827c6b6ede5213d84b5be02588ad4cbf960d95bd37"
    end
  end

  def install
    bin.install "djls"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/djls --version")
  end
end
