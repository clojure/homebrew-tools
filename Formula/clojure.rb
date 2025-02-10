class Clojure < Formula
  desc "The Clojure Programming Language"
  homepage "https://clojure.org"
  url "https://github.com/clojure/brew-install/releases/download/1.12.0.1517/clojure-tools-1.12.0.1517.tar.gz"
  mirror "https://download.clojure.org/install/clojure-tools-1.12.0.1517.tar.gz"
  sha256 "38694e876c7a5360c16f4b7d2c3993b723201c58226d0938cd021765e33a51ef"
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
