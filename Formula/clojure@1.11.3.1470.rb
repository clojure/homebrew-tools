class ClojureAT11131470 < Formula
  desc "The Clojure Programming Language"
  homepage "https://clojure.org"
  url "https://github.com/clojure/brew-install/releases/download/1.11.3.1470/clojure-tools-1.11.3.1470.tar.gz"
  mirror "https://download.clojure.org/install/clojure-tools-1.11.3.1470.tar.gz"
  sha256 "5acf449efa1ef94d38643f81e80a31417be7ee189dbd513a0e0adf0c9edb4a49"
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
