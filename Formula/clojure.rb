class Clojure < Formula
  desc "The Clojure Programming Language"
  homepage "https://clojure.org"
  url "https://github.com/clojure/brew-install/releases/download/1.12.5.1645/clojure-tools-1.12.5.1645.tar.gz"
  mirror "https://download.clojure.org/install/clojure-tools-1.12.5.1645.tar.gz"
  sha256 "4a8612e7fd725ec8e453f870b22d5bc1a68eeff774c3d79329a985f351c0b83b"
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
