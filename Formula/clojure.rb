class Clojure < Formula
  desc "The Clojure Programming Language"
  homepage "https://clojure.org"
  url "https://github.com/clojure/brew-install/releases/download/1.12.1.1538/clojure-tools-1.12.1.1538.tar.gz"
  mirror "https://download.clojure.org/install/clojure-tools-1.12.1.1538.tar.gz"
  sha256 "1c878646fda838b39a5b53574bc96f3d22a2a8f474f34d84540158287aaed63e"
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
