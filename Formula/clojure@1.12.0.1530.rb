class ClojureAT11201530 < Formula
  desc "The Clojure Programming Language"
  homepage "https://clojure.org"
  url "https://github.com/clojure/brew-install/releases/download/1.12.0.1530/clojure-tools-1.12.0.1530.tar.gz"
  mirror "https://download.clojure.org/install/clojure-tools-1.12.0.1530.tar.gz"
  sha256 "0ff24b8a8126ba39d32de784a08767c5df259384cb76c6ee3db4d6102705ed49"
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
