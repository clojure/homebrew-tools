class Clojure < Formula
  desc "The Clojure Programming Language"
  homepage "https://clojure.org"
  url "https://github.com/clojure/brew-install/releases/download/1.12.4.1597/clojure-tools-1.12.4.1597.tar.gz"
  mirror "https://download.clojure.org/install/clojure-tools-1.12.4.1597.tar.gz"
  sha256 "0e012f5d513169ec434cba289e1fdf552e671e381e90be8194560b33d5fac243"
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
