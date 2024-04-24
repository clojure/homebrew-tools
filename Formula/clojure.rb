class Clojure < Formula
  desc "The Clojure Programming Language"
  homepage "https://clojure.org"
  url "https://github.com/clojure/brew-install/releases/download/1.11.3.1456/clojure-tools-1.11.3.1456.tar.gz"
  mirror "https://download.clojure.org/install/clojure-tools-1.11.3.1456.tar.gz"
  sha256 "ca63a45140d28f92b314c058d43ee012b8cf00ae44fd08c50c67300e8e5fcd6d"
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
