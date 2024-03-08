class Clojure < Formula
  desc "The Clojure Programming Language"
  homepage "https://clojure.org"
  url "https://github.com/clojure/brew-install/releases/download/1.11.2.1446/clojure-tools-1.11.2.1446.tar.gz"
  mirror "https://download.clojure.org/install/clojure-tools-1.11.2.1446.tar.gz"
  sha256 "aa7effb0fc950df8d93cb796c655010658c05bf77c702c3a9449b7fdd792ef71"
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
