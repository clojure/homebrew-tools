class ClojureAT11241629 < Formula
  desc "The Clojure Programming Language"
  homepage "https://clojure.org"
  url "https://github.com/clojure/brew-install/releases/download/1.12.4.1629/clojure-tools-1.12.4.1629.tar.gz"
  mirror "https://download.clojure.org/install/clojure-tools-1.12.4.1629.tar.gz"
  sha256 "b30045d2587ebc0bcf1ca2a85c75d71dc56d7c74de7eee6dc7fdefc25f7728ce"
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
