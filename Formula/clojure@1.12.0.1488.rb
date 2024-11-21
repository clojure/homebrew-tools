class ClojureAT11201488 < Formula
  desc "The Clojure Programming Language"
  homepage "https://clojure.org"
  url "https://github.com/clojure/brew-install/releases/download/1.12.0.1488/clojure-tools-1.12.0.1488.tar.gz"
  mirror "https://download.clojure.org/install/clojure-tools-1.12.0.1488.tar.gz"
  sha256 "bc19be0010bef0421c26fd3bec7bc3bca08c192828d59a151845422dc4420742"
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
