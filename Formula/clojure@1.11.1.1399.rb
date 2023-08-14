class ClojureAT11111399 < Formula
  desc "The Clojure Programming Language"
  homepage "https://clojure.org"
  url "https://github.com/clojure/brew-install/releases/download/1.11.1.1399/clojure-tools-1.11.1.1399.tar.gz"
  mirror "https://download.clojure.org/install/clojure-tools-1.11.1.1399.tar.gz"
  sha256 "82481f11187317e35bd466fb7764d560332fce565a994e39d27c82c958574a7b"
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
