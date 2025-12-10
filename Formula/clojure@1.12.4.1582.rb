class ClojureAT11241582 < Formula
  desc "The Clojure Programming Language"
  homepage "https://clojure.org"
  url "https://github.com/clojure/brew-install/releases/download/1.12.4.1582/clojure-tools-1.12.4.1582.tar.gz"
  mirror "https://download.clojure.org/install/clojure-tools-1.12.4.1582.tar.gz"
  sha256 "fd5864f22bf2ec30311f9ce3caf3d31799e04d653b657ecdb4f0836fe972ff21"
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
