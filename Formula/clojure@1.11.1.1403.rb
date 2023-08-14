class ClojureAT11111403 < Formula
  desc "The Clojure Programming Language"
  homepage "https://clojure.org"
  url "https://github.com/clojure/brew-install/releases/download/1.11.1.1403/clojure-tools-1.11.1.1403.tar.gz"
  mirror "https://download.clojure.org/install/clojure-tools-1.11.1.1403.tar.gz"
  sha256 "6d5347104ce93da9cf17ca5f0cfe75775ddbc6ff60646cea7333661503a4eb32"
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
