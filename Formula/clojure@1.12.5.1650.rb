class ClojureAT11251650 < Formula
  desc "The Clojure Programming Language"
  homepage "https://clojure.org"
  url "https://github.com/clojure/brew-install/releases/download/1.12.5.1650/clojure-tools-1.12.5.1650.tar.gz"
  mirror "https://download.clojure.org/install/clojure-tools-1.12.5.1650.tar.gz"
  sha256 "483ac8ffefb6242d52414478e2dbd7717e2cd2b6b1e2894a3b2195416814c284"
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
