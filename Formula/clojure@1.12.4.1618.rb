class ClojureAT11241618 < Formula
  desc "The Clojure Programming Language"
  homepage "https://clojure.org"
  url "https://github.com/clojure/brew-install/releases/download/1.12.4.1618/clojure-tools-1.12.4.1618.tar.gz"
  mirror "https://download.clojure.org/install/clojure-tools-1.12.4.1618.tar.gz"
  sha256 "13769da6d63a98deb2024378ae1a64e4ee211ac1035340dfca7a6944c41cde21"
  license "EPL-1.0"

  depends_on "rlwrap"

  uses_from_macos "ruby" => :build

  def install
    system "./install.sh", prefix
  end

  test do
    ENV["TERM"] = "xterm"
    system("#{bin}/clj -M -e nil")
    %w[clojure clj].each do |clj|
      assert_equal "2", shell_output("#{bin}/#{clj} -M -e \"(+ 1 1)\"").strip
    end
  end
end
