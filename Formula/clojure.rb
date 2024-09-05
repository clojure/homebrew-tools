class Clojure < Formula
  desc "The Clojure Programming Language"
  homepage "https://clojure.org"
  url "https://github.com/clojure/brew-install/releases/download/1.12.0.1479/clojure-tools-1.12.0.1479.tar.gz"
  mirror "https://download.clojure.org/install/clojure-tools-1.12.0.1479.tar.gz"
  sha256 "2a515c45755df1edf378fdfafb380251c7736de2db15f7dbe55ed7295f0d296c"
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
