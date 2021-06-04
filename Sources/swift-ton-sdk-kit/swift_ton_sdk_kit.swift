import TonClientSwift

public final class TonSdkKit {

    public var client: TSDKClientModule

    public init(client: TSDKClientModule) {
        self.client = client
    }
}
