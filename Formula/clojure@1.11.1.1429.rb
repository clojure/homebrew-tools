class ClojureAT11111429 < Formula
  desc "The Clojure Programming Language"
  homepage "https://clojure.org"
  url "https://github.com/clojure/brew-install/releases/download/1.11.1.1429/clojure-tools-1.11.1.1429.tar.gz"
  mirror "https://download.clojure.org/install/clojure-tools-1.11.1.1429.tar.gz"
  sha256 "a2fdecd6a3c61df3c600fb60c00a8f1be854e91e6718c03bb9c83c415a6ab82e"
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
