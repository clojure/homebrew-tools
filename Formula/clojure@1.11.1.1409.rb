class ClojureAT11111409 < Formula
  desc "The Clojure Programming Language"
  homepage "https://clojure.org"
  url "https://github.com/clojure/brew-install/releases/download/1.11.1.1409/clojure-tools-1.11.1.1409.tar.gz"
  mirror "https://download.clojure.org/install/clojure-tools-1.11.1.1409.tar.gz"
  sha256 "be9f991ba2cd811993e69009d6a2bfea7853c6ad5274221399fdb3ad0242fe35"
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
