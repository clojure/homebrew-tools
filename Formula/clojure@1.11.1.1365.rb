class ClojureAT11111365 < Formula
  desc "The Clojure Programming Language"
  homepage "https://clojure.org"
  mirror "https://github.com/clojure/brew-install/releases/download/1.11.1.1365/clojure-tools-1.11.1.1365.tar.gz"
  url "https://download.clojure.org/install/clojure-tools-1.11.1.1365.tar.gz"
  sha256 "178befa8e7c9f34731490c595100c39b76917be3c9b1e9c01c3f5db41ac67148"
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
