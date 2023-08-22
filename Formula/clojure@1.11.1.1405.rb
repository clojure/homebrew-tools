class ClojureAT11111405 < Formula
  desc "The Clojure Programming Language"
  homepage "https://clojure.org"
  url "https://github.com/clojure/brew-install/releases/download/1.11.1.1405/clojure-tools-1.11.1.1405.tar.gz"
  mirror "https://download.clojure.org/install/clojure-tools-1.11.1.1405.tar.gz"
  sha256 "b2a2a19dd74ecb6aca718b4cdab4a26872228686a367c1817c17f2538a0fb574"
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
