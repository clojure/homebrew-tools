class ClojureAT11211561 < Formula
  desc "The Clojure Programming Language"
  homepage "https://clojure.org"
  url "https://github.com/clojure/brew-install/releases/download/1.12.1.1561/clojure-tools-1.12.1.1561.tar.gz"
  mirror "https://download.clojure.org/install/clojure-tools-1.12.1.1561.tar.gz"
  sha256 "fbb8457f64bf33cc8caaf7be77c4630a828167447777a809a9aae587d535075f"
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
