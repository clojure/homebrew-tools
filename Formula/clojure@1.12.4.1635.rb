class ClojureAT11241635 < Formula
  desc "The Clojure Programming Language"
  homepage "https://clojure.org"
  url "https://github.com/clojure/brew-install/releases/download/1.12.4.1635/clojure-tools-1.12.4.1635.tar.gz"
  mirror "https://download.clojure.org/install/clojure-tools-1.12.4.1635.tar.gz"
  sha256 "9f218c8cb2b76cdcecb4bb3764b5cf99738d8db50ff90eca3297555dc1885c4b"
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
