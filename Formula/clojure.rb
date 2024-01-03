class Clojure < Formula
  desc "The Clojure Programming Language"
  homepage "https://clojure.org"
  url "https://github.com/clojure/brew-install/releases/download/1.11.1.1435/clojure-tools-1.11.1.1435.tar.gz"
  mirror "https://download.clojure.org/install/clojure-tools-1.11.1.1435.tar.gz"
  sha256 "452fc579b2040fc45861745704a5d93d144e3b41eac83a34ce16fea784399bc0"
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
