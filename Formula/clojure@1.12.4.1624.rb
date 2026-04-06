class ClojureAT11241624 < Formula
  desc "The Clojure Programming Language"
  homepage "https://clojure.org"
  url "https://github.com/clojure/brew-install/releases/download/1.12.4.1624/clojure-tools-1.12.4.1624.tar.gz"
  mirror "https://download.clojure.org/install/clojure-tools-1.12.4.1624.tar.gz"
  sha256 "199a7b80d8f202f448232bd05272e3fef37baa22c1c62ac90b165ec48d6031c4"
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
