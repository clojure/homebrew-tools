class Clojure < Formula
  desc "The Clojure Programming Language"
  homepage "https://clojure.org"
  url "https://github.com/clojure/brew-install/releases/download/1.12.5.1664/clojure-tools-1.12.5.1664.tar.gz"
  mirror "https://download.clojure.org/install/clojure-tools-1.12.5.1664.tar.gz"
  sha256 "77dd6868948074adcc93e83a796f8e8f15a1a92bcb1b9002d715fd2210e476f3"
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
