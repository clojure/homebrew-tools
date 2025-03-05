class ClojureAT11201527 < Formula
  desc "The Clojure Programming Language"
  homepage "https://clojure.org"
  url "https://github.com/clojure/brew-install/releases/download/1.12.0.1527/clojure-tools-1.12.0.1527.tar.gz"
  mirror "https://download.clojure.org/install/clojure-tools-1.12.0.1527.tar.gz"
  sha256 "2693459ac12dfae88ccdb9ae97e117c6724c8f77e1850e36db20f10f129c1e7e"
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
