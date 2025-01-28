class ClojureAT11201501 < Formula
  desc "The Clojure Programming Language"
  homepage "https://clojure.org"
  url "https://github.com/clojure/brew-install/releases/download/1.12.0.1501/clojure-tools-1.12.0.1501.tar.gz"
  mirror "https://download.clojure.org/install/clojure-tools-1.12.0.1501.tar.gz"
  sha256 "2b9a5c2852115ec1feec8f10c71a8446c3dc9676849f9694247755b4c228300c"
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
